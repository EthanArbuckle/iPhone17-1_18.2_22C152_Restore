@interface TUILayout
+ (const)_storageDataset;
+ (void)initialize;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)aspectConstrainedSpecifiedHeight;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)aspectConstrainedSpecifiedWidth;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicHeight;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicWidth;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)computedContentHeight;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)computedContentHeightConsideringTransform;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)computedContentWidth;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)computedContentWidthConsideringTransform;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)computedHeight;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)computedWidth;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)modifiedSpecifiedWidthForChild:(SEL)a3;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)specifiedHeight;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)specifiedWidth;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)validatedIntrinsicHeight;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)validatedIntrinsicHeightConsideringSpecified;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)validatedIntrinsicWidth;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)validatedIntrinsicWidthConsideringSpecified;
- (BOOL)collectHostingPropertiesWithCollector:(id)a3;
- (BOOL)collectImpressionsForChild:(id)a3;
- (BOOL)collectImpressionsForChildren;
- (BOOL)collectLinkEntitiesForChild:(id)a3;
- (BOOL)collectLinkEntitiesForChildren;
- (BOOL)desdendantSpecifiedWidthModified;
- (BOOL)hidden;
- (BOOL)invalidChildren;
- (BOOL)isDescendentOfLayout:(id)a3;
- (BOOL)isHorizontallyAligningChildren;
- (BOOL)isIntrinsicHeightInvalid;
- (BOOL)isIntrinsicSizeInvalid;
- (BOOL)isIntrinsicWidthInvalid;
- (BOOL)isLayout;
- (BOOL)isValidating;
- (BOOL)isVerticallyAligningChildren;
- (BOOL)layoutIsInvalid;
- (BOOL)shouldAppendChildAnchorsForAncestor;
- (BOOL)shouldAppendChildRenderModels;
- (BOOL)shouldAutoInvalidateRenderModelOnChildInvalidate;
- (BOOL)shouldDescendentsInheritRefSpecWithContext:(id)a3;
- (BOOL)shouldUpdateContainingMetricsForScrollableContent;
- (BOOL)shouldUseDefaultGuideForLayout:(id)a3 edge:(unint64_t)a4;
- (BOOL)shouldUseSubviewRenderModelWithContext:(id)a3;
- (BOOL)specifiedHeightComputeInherited;
- (BOOL)specifiedWidthComputeInherited;
- (BOOL)specifiedWidthModified;
- (BOOL)validatesAllChildren;
- (CGAffineTransform)_computedFrameTransform;
- (CGAffineTransform)computedTransformInAncestorLayout:(SEL)a3;
- (CGAffineTransform)renderTransform;
- (CGAffineTransform)specifiedTransform;
- (CGPoint)computedOrigin;
- (CGRect)computedBounds;
- (CGRect)computedBoundsPrimitiveWithFlags:(unint64_t)a3;
- (CGRect)computedBoundsWithFlags:(unint64_t)a3;
- (CGRect)computedErasableBounds;
- (CGRect)computedFrame;
- (CGSize)computedNaturalSize;
- (CGSize)computedTransformedSize;
- (CGSize)renderModelSizeWithContext:(id)a3;
- (CGSize)validatedIntrinsicSize;
- (NSArray)children;
- (NSArray)containers;
- (NSString)description;
- (TUIBox)box;
- (TUIGuide)guideBottom;
- (TUIGuide)guideLeading;
- (TUIGuide)guideTop;
- (TUIGuide)guideTrailing;
- (TUIGuideLayoutController)guideLayoutController;
- (TUILayout)initWithModel:(id)a3 parent:(id)a4 controller:(id)a5;
- (TUILayout)layoutAncestor;
- (TUILayoutContaining)parent;
- (TUILayoutController)controller;
- (TUIModelLayoutable)model;
- (UIEdgeInsets)erasableInsetsForContentsScale:(double)a3;
- (double)_computeHeight:(BOOL)a3;
- (double)_computeWidth:(BOOL)a3;
- (double)computeDerivedHeight;
- (double)computeDerivedWidth;
- (double)computeHeight;
- (double)computeHeightWithoutDerived;
- (double)computeIntrinsicAspectRatio;
- (double)computeWidth;
- (double)computeWidthWithoutDerived;
- (double)computedHeightAbovePivot;
- (double)computedHorizontalCenter;
- (double)computedLeadingEdge;
- (double)computedScale;
- (double)containingHeight;
- (double)containingMaxWidth;
- (double)containingWidth;
- (double)flexedHeight;
- (double)flexedWidth;
- (id).cxx_construct;
- (id)_transformedRenderModel:(id)a3 transform:(CGAffineTransform *)a4 context:(id)a5 allowCache:(BOOL)a6;
- (id)axModelTreeWithCustomActionsCollector:(id)a3 scrollAncestorLayout:(id)a4 scrollAncestorTranslation:(CGPoint)a5 liveTransformAncestorLayout:(id)a6;
- (id)cachedRenderModel;
- (id)collectLinkEntities;
- (id)computedRefIdWithContext:(id)a3;
- (id)computedRefInstanceWithContext:(id)a3;
- (id)debugContentDescription;
- (id)guideProvider;
- (id)guideProviderForLayout:(id)a3;
- (id)hoverIdentifierWithName:(id)a3;
- (id)inheritedRefIdWithContext:(id)a3;
- (id)inheritedRefInstanceWithContext:(id)a3;
- (id)modelIdentifierForEnclosingScrollable;
- (id)modelIdentifierForScrollable;
- (id)newLiveTransform:(CGAffineTransform *)a3;
- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4;
- (id)recursiveDescription;
- (id)rootLayout;
- (id)scrollAncestorForChildrenWithAncestor:(id)a3;
- (int64_t)computeZIndexWithDefault:(int64_t)a3;
- (unint64_t)computedLayoutDirection;
- (unint64_t)pinPositionFromLiveTransformKind:(unint64_t)a3;
- (unint64_t)specifiedLayoutDirection;
- (void)_computeAspectConstrainedSpecifiedWidthHeight;
- (void)_updateChildren;
- (void)_validateLayout;
- (void)_validateLayoutWithBlock:(id)a3;
- (void)appendAnchorsToSet:(id)a3 inRoot:(id)a4;
- (void)appendChildAnchorsToSet:(id)a3 inRoot:(id)a4;
- (void)appendChildRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4 transform:(CGAffineTransform *)a5 toModels:(id)a6;
- (void)appendChilden:(id)a3 renderModelCompatibleWithKind:(unint64_t)a4 context:(id)a5 transform:(CGAffineTransform *)a6 toModels:(id)a7;
- (void)appendEmbeddedIdentifierMaps:(id)a3 updateControllers:(id)a4 UUIDs:(id)a5;
- (void)appendHoverRegions:(id)a3 relativeToLayout:(id)a4;
- (void)appendLayoutsWithSpecifiedWidthModifiedToArray:(id)a3;
- (void)appendRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4 transform:(CGAffineTransform *)a5 toModels:(id)a6;
- (void)appendRenderModelIgnoreHiddenCompatibleWithKind:(unint64_t)a3 context:(id)a4 transform:(CGAffineTransform *)a5 toModels:(id)a6;
- (void)appendVisibleBoundsObservers:(id)a3 axis:(unint64_t)a4 offset:(double)a5;
- (void)computeLayout;
- (void)enumerateChildren:(id)a3;
- (void)enumerateLayout:(id)a3;
- (void)invalidateIntrinsicSize;
- (void)invalidateLayout;
- (void)invalidateRenderModel;
- (void)notifyChildrenScaleDidChange;
- (void)onComputedOriginDidChange;
- (void)onComputedScaleDidChange;
- (void)onContainersUpdated;
- (void)onInvalidate;
- (void)onInvalidateIntrinsicSize;
- (void)onSpecifiedHeightChanged;
- (void)onSpecifiedWidthChanged;
- (void)setComputedNaturalSize:(CGSize)a3;
- (void)setComputedOrigin:(CGPoint)a3;
- (void)setContainers:(id)a3;
- (void)setContainingHeight:(double)a3;
- (void)setContainingMaxWidth:(double)a3;
- (void)setContainingWidth:(double)a3;
- (void)setFlexedHeight:(double)a3;
- (void)setFlexedWidth:(double)a3;
- (void)setGuideBottom:(id)a3;
- (void)setGuideLayoutController:(id)a3;
- (void)setGuideLeading:(id)a3;
- (void)setGuideTop:(id)a3;
- (void)setGuideTrailing:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setInvalidChildren:(BOOL)a3;
- (void)setLayoutIsInvalid:(BOOL)a3;
- (void)setSpecifiedHeightComputeInherited:(BOOL)a3;
- (void)setSpecifiedLayoutDirection:(unint64_t)a3;
- (void)setSpecifiedWidthComputeInherited:(BOOL)a3;
- (void)setSpecifiedWidthModified:(BOOL)a3;
- (void)teardown;
- (void)updateDesdendantSpecifiedWidthModifiedWithFlag:(BOOL)a3;
- (void)updateGuides;
- (void)updateParent:(id)a3;
- (void)validateGuides;
- (void)validateLayout;
@end

@implementation TUILayout

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    if (qword_2DF700 != -1) {
      dispatch_once(&qword_2DF700, &stru_2558F8);
    }
    v2 = (unsigned int *)[(id)qword_2DF6F8 bytes];
    uint64_t v3 = v2[1];
    if (v3)
    {
      v4 = (const char *)v2;
      uint64_t v5 = 0;
      v6 = (char *)(v2 + 2);
      while (strcmp("layout", &v4[*(unsigned int *)&v6[v5]]))
      {
        v5 += 4;
        if (4 * v3 == v5)
        {
          uint64_t v7 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v7 = (uint64_t)&v4[*(unsigned int *)&v6[4 * v3 + v5]];
LABEL_11:
      uint64_t v9 = 0;
      TUILayoutStorageDataset = v7;
      while (strcmp("imagelayout", &v4[*(unsigned int *)&v6[4 * v9]]))
      {
        if (v3 == ++v9)
        {
          uint64_t v8 = 0;
          goto LABEL_16;
        }
      }
      uint64_t v8 = (uint64_t)&v4[*(unsigned int *)&v6[4 * v3 + 4 * v9]];
    }
    else
    {
      uint64_t v8 = 0;
      TUILayoutStorageDataset = 0;
    }
LABEL_16:
    TUIImageLayoutStorageDataset = v8;
  }
}

- (id)recursiveDescription
{
  uint64_t v3 = +[NSMutableString string];
  sub_10948C(self, v3, 0);

  return v3;
}

- (id)cachedRenderModel
{
  return [(TUIRenderModelTransform *)self->_cachedTransformModel submodel];
}

- (CGAffineTransform)specifiedTransform
{
  result = (CGAffineTransform *)self->_model;
  if (result) {
    return (CGAffineTransform *)[(CGAffineTransform *)result transform];
  }
  long long v4 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v4;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  return result;
}

- (CGAffineTransform)renderTransform
{
  result = (CGAffineTransform *)self->_model;
  if (result) {
    return (CGAffineTransform *)[(CGAffineTransform *)result renderTransform];
  }
  long long v4 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v4;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  return result;
}

- (void)setSpecifiedWidthComputeInherited:(BOOL)a3
{
  if (((((*(_DWORD *)&self->_flags & 0x200) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      int v3 = 512;
    }
    else {
      int v3 = 0;
    }
    self->_flags = ($2E822BB417F7D1609F669B00B90D7CC3)(*(_DWORD *)&self->_flags & 0xFFFFFDFF | v3);
    [(TUILayout *)self onSpecifiedWidthChanged];
  }
}

- (BOOL)specifiedWidthComputeInherited
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (void)setSpecifiedWidthModified:(BOOL)a3
{
  if (((((*(_DWORD *)&self->_flags & 0x400) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      int v3 = 1024;
    }
    else {
      int v3 = 0;
    }
    self->_flags = ($2E822BB417F7D1609F669B00B90D7CC3)(*(_DWORD *)&self->_flags & 0xFFFFFBFF | v3);
    [(TUILayout *)self onSpecifiedWidthChanged];
  }
}

- (BOOL)specifiedWidthModified
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (void)setSpecifiedHeightComputeInherited:(BOOL)a3
{
  if (((((*(_DWORD *)&self->_flags & 0x800) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      int v3 = 2048;
    }
    else {
      int v3 = 0;
    }
    self->_flags = ($2E822BB417F7D1609F669B00B90D7CC3)(*(_DWORD *)&self->_flags & 0xFFFFF7FF | v3);
    [(TUILayout *)self onSpecifiedHeightChanged];
  }
}

- (void)onSpecifiedWidthChanged
{
  [(TUILayout *)self invalidateLayout];
  id v3 = [(TUILayout *)self layoutAncestor];
  [v3 onSpecifiedWidthChangedForChild:self];
}

- (void)onSpecifiedHeightChanged
{
  id v3 = [(TUILayout *)self layoutAncestor];
  [v3 onSpecifiedHeightChangedForChild:self];
}

- (BOOL)specifiedHeightComputeInherited
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 3) & 1;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)specifiedWidth
{
  model = self->_model;
  if (model) {
    uint64_t v5 = (uint64_t)[(TUIModelLayoutable *)model width];
  }
  else {
    uint64_t v5 = 0x7FC000007FC00000;
  }
  $2E822BB417F7D1609F669B00B90D7CC3 flags = self->_flags;
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    uint64_t v8 = [(TUILayout *)self layoutAncestor];
    uint64_t v7 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)[v8 modifiedSpecifiedWidthForChild:self];
  }
  else if ((*(_WORD *)&flags & 0x200) != 0)
  {
    return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v5 & 0xFFFFFFFF00000000 | 0x7FC00000);
  }
  else
  {
    return ($881BB7C90C7D0DFCC1492E3DC022A30F *)v5;
  }
  return v7;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)specifiedHeight
{
  model = self->_model;
  if (model) {
    result = ($881BB7C90C7D0DFCC1492E3DC022A30F *)[(TUIModelLayoutable *)model height];
  }
  else {
    result = ($881BB7C90C7D0DFCC1492E3DC022A30F *)0x7FC000007FC00000;
  }
  if ((*(_DWORD *)&self->_flags & 0x800) != 0) {
    return ($881BB7C90C7D0DFCC1492E3DC022A30F *)((unint64_t)result & 0xFFFFFFFF00000000 | 0x7FC00000);
  }
  return result;
}

+ (const)_storageDataset
{
  return (const Dataset *)TUILayoutStorageDataset;
}

- (TUILayout)initWithModel:(id)a3 parent:(id)a4 controller:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v29.receiver = self;
  v29.super_class = (Class)TUILayout;
  v12 = [(TUILayout *)&v29 init];
  if (!v12) {
    goto LABEL_23;
  }
  v12->_storage._data = (unint64_t)[(id)objc_opt_class() _storageDataset] | 1;
  id v13 = v9;
  objc_storeStrong((id *)&v12->_model, a3);
  objc_storeWeak((id *)&v12->_parent, v10);
  objc_storeWeak((id *)&v12->_controller, v11);
  p_$2E822BB417F7D1609F669B00B90D7CC3 flags = (unsigned int *)&v12->_flags;
  bzero(&v12->_flags, 8uLL);
  if (v13)
  {
    [v13 width];
    uint64_t v16 = v15;
    [v13 height];
    uint64_t v18 = v17;
    if (v10)
    {
LABEL_4:
      unsigned int v19 = *p_flags & 0xFFFFFDFF;
      *p_$2E822BB417F7D1609F669B00B90D7CC3 flags = v19;
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v16 = 0x200007FC00000;
    uint64_t v18 = 0x200007FC00000;
    if (v10) {
      goto LABEL_4;
    }
  }
  if ((v16 & 0x6000000000000) == 0x2000000000000)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v12->_controller);
    if ([WeakRetained shouldRootLayoutInheritWidthWhenAuto]) {
      int v21 = 512;
    }
    else {
      int v21 = 0;
    }
    *p_$2E822BB417F7D1609F669B00B90D7CC3 flags = *p_flags & 0xFFFFFDFF | v21;
  }
  else
  {
    *p_flags &= ~0x200u;
  }
  if ((v18 & 0x6000000000000) == 0x2000000000000)
  {
    id v22 = objc_loadWeakRetained((id *)&v12->_controller);
    if ([v22 shouldRootLayoutInheritHeightWhenAuto]) {
      int v23 = 2048;
    }
    else {
      int v23 = 0;
    }
    *p_$2E822BB417F7D1609F669B00B90D7CC3 flags = *p_flags & 0xFFFFF7FF | v23;

    unsigned int v24 = *p_flags;
    goto LABEL_19;
  }
  unsigned int v19 = *p_flags;
LABEL_18:
  unsigned int v24 = v19 & 0xFFFFF7FF;
  *p_$2E822BB417F7D1609F669B00B90D7CC3 flags = v24;
LABEL_19:
  unsigned int v25 = v24 & 0xFFFF0FCF | 0x30;
  *p_$2E822BB417F7D1609F669B00B90D7CC3 flags = v25;
  if (v13)
  {
    unsigned __int8 v26 = [v13 layoutDirection];
    unsigned int v25 = *p_flags;
    int v27 = (v26 & 3) << 7;
  }
  else
  {
    int v27 = 0;
  }
  v12->_$2E822BB417F7D1609F669B00B90D7CC3 flags = ($2E822BB417F7D1609F669B00B90D7CC3)(v27 | v25 & 0xFFFFFE7F);
  [(TUILayout *)v12 updateGuides];

LABEL_23:
  return v12;
}

- (void)updateParent:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);

  uint64_t v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_parent, obj);
    uint64_t v5 = obj;
    *(_DWORD *)&self->_flags &= ~0x400u;
  }
}

- (TUIBox)box
{
  return (TUIBox *)self->_model;
}

- (BOOL)isLayout
{
  return 1;
}

- (void)validateGuides
{
  [(TUILayout *)self updateGuides];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v3 = [(TUILayout *)self children];
  id v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) validateGuides];
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)updateGuides
{
  id v3 = [(TUILayout *)self box];
  id v23 = [v3 guides];

  id v4 = [(TUILayout *)self guideProvider];
  if (v23 && v4)
  {
    uint64_t v5 = [v23 leading];
    v6 = v5;
    if (!v5)
    {
      v6 = [v4 defaultGuideSpecForLayout:self edge:0];
    }
    long long v7 = [v4 guideForLayout:self spec:v6];
    [(TUILayout *)self setGuideLeading:v7];

    if (!v5) {
    long long v8 = [v23 trailing];
    }
    long long v9 = v8;
    if (!v8)
    {
      long long v9 = [v4 defaultGuideSpecForLayout:self edge:1];
    }
    long long v10 = [v4 guideForLayout:self spec:v9];
    [(TUILayout *)self setGuideTrailing:v10];

    if (!v8) {
    id v11 = [v23 top];
    }
    v12 = v11;
    if (!v11)
    {
      v12 = [v4 defaultGuideSpecForLayout:self edge:2];
    }
    id v13 = [v4 guideForLayout:self spec:v12];
    [(TUILayout *)self setGuideTop:v13];

    if (!v11) {
    v14 = [v23 bottom];
    }
    uint64_t v15 = v14;
    if (!v14)
    {
      uint64_t v15 = [v4 defaultGuideSpecForLayout:self edge:3];
    }
    uint64_t v16 = [v4 guideForLayout:self spec:v15];
    [(TUILayout *)self setGuideBottom:v16];

    if (v14) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  if (v4)
  {
    uint64_t v17 = [v4 defaultGuideSpecForLayout:self edge:0];
    uint64_t v18 = [v4 guideForLayout:self spec:v17];
    [(TUILayout *)self setGuideLeading:v18];

    unsigned int v19 = [v4 defaultGuideSpecForLayout:self edge:1];
    v20 = [v4 guideForLayout:self spec:v19];
    [(TUILayout *)self setGuideTrailing:v20];

    int v21 = [v4 defaultGuideSpecForLayout:self edge:2];
    id v22 = [v4 guideForLayout:self spec:v21];
    [(TUILayout *)self setGuideTop:v22];

    v14 = [v4 defaultGuideSpecForLayout:self edge:3];
    uint64_t v15 = [v4 guideForLayout:self spec:v14];
    [(TUILayout *)self setGuideBottom:v15];
LABEL_21:

LABEL_22:
    goto LABEL_23;
  }
  [(TUILayout *)self setGuideLeading:0];
  [(TUILayout *)self setGuideTrailing:0];
  [(TUILayout *)self setGuideTop:0];
  [(TUILayout *)self setGuideBottom:0];
LABEL_23:
}

- (TUILayout)layoutAncestor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  id v3 = [WeakRetained layout];

  return (TUILayout *)v3;
}

- (void)enumerateLayout:(id)a3
{
}

- (void)enumerateChildren:(id)a3
{
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = self->_containers;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      long long v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) enumerateLayout:v4];
        long long v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_updateChildren
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10A420;
  v6[3] = &unk_255888;
  id v3 = (id)objc_opt_new();
  id v7 = v3;
  [(TUILayout *)self enumerateChildren:v6];
  id v4 = (NSArray *)[v3 copy];
  children = self->_children;
  self->_children = v4;
}

- (void)setHidden:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_$2E822BB417F7D1609F669B00B90D7CC3 flags = ($2E822BB417F7D1609F669B00B90D7CC3)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hidden
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (unint64_t)specifiedLayoutDirection
{
  return ((unint64_t)self->_flags >> 7) & 3;
}

- (void)setSpecifiedLayoutDirection:(unint64_t)a3
{
  self->_$2E822BB417F7D1609F669B00B90D7CC3 flags = ($2E822BB417F7D1609F669B00B90D7CC3)(*(_DWORD *)&self->_flags & 0xFFFFFE7F | ((a3 & 3) << 7));
}

- (unint64_t)computedLayoutDirection
{
  id v2 = (id)(((unint64_t)self->_flags >> 7) & 3);
  if (!v2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);

    if (WeakRetained)
    {
      uint64_t v5 = [(TUILayout *)self layoutAncestor];
      id v2 = [v5 computedLayoutDirection];
    }
    else
    {
      return 1;
    }
  }
  return (unint64_t)v2;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicWidth
{
  return ($881BB7C90C7D0DFCC1492E3DC022A30F *)0x7FC000007FC00000;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicHeight
{
  return ($881BB7C90C7D0DFCC1492E3DC022A30F *)0x7FC000007FC00000;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)validatedIntrinsicWidth
{
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    id v4 = [(TUILayout *)self computeIntrinsicWidth];
    uint64_t v6 = v5;
    if ((v5 & 0x7000000000000) == 0x2000000000000)
    {
      uint64_t v7 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 1u);
      if (v7)
      {
        DataForKey = (void *)v7;
        TUI::Util::PartialStruct::Storage::markAsDefault(&self->_storage._data, 1u);
LABEL_6:
        void *DataForKey = v4;
        DataForKey[1] = v6;
      }
    }
    else
    {
      DataForKey = (void *)TUI::Util::PartialStruct::Storage::allocateDataForKey((TUI::Util::PartialStruct::Storage::Header **)&self->_storage, 1u, 0x10uLL, 1);
      if (DataForKey) {
        goto LABEL_6;
      }
    }
    *(_DWORD *)&self->_flags &= ~0x10u;
  }
  uint64_t v9 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 1u);
  long long v10 = ($881BB7C90C7D0DFCC1492E3DC022A30F **)&TUILengthNull;
  if (v9) {
    long long v10 = ($881BB7C90C7D0DFCC1492E3DC022A30F **)v9;
  }
  return *v10;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)validatedIntrinsicHeight
{
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    id v4 = [(TUILayout *)self computeIntrinsicHeight];
    uint64_t v6 = v5;
    if ((v5 & 0x7000000000000) == 0x2000000000000)
    {
      uint64_t v7 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 0xCu);
      if (v7)
      {
        DataForKey = (void *)v7;
        TUI::Util::PartialStruct::Storage::markAsDefault(&self->_storage._data, 0xCu);
LABEL_6:
        void *DataForKey = v4;
        DataForKey[1] = v6;
      }
    }
    else
    {
      DataForKey = (void *)TUI::Util::PartialStruct::Storage::allocateDataForKey((TUI::Util::PartialStruct::Storage::Header **)&self->_storage, 0xCu, 0x10uLL, 1);
      if (DataForKey) {
        goto LABEL_6;
      }
    }
    *(_DWORD *)&self->_flags &= ~0x20u;
  }
  uint64_t v9 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 0xCu);
  long long v10 = ($881BB7C90C7D0DFCC1492E3DC022A30F **)&TUILengthNull;
  if (v9) {
    long long v10 = ($881BB7C90C7D0DFCC1492E3DC022A30F **)v9;
  }
  return *v10;
}

- (CGSize)validatedIntrinsicSize
{
  float v3 = COERCE_FLOAT([(TUILayout *)self validatedIntrinsicWidthConsideringSpecified]);
  float v4 = COERCE_FLOAT([(TUILayout *)self validatedIntrinsicHeightConsideringSpecified]);
  double v5 = v3;
  double v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)setGuideLeading:(id)a3
{
}

- (TUIGuide)guideLeading
{
  ObjectForKey = TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 9u);

  return (TUIGuide *)ObjectForKey;
}

- (void)setGuideTrailing:(id)a3
{
}

- (TUIGuide)guideTrailing
{
  ObjectForKey = TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 8u);

  return (TUIGuide *)ObjectForKey;
}

- (void)setGuideTop:(id)a3
{
}

- (TUIGuide)guideTop
{
  ObjectForKey = TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 3u);

  return (TUIGuide *)ObjectForKey;
}

- (void)setGuideBottom:(id)a3
{
}

- (TUIGuide)guideBottom
{
  ObjectForKey = TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 4u);

  return (TUIGuide *)ObjectForKey;
}

- (void)setGuideLayoutController:(id)a3
{
}

- (TUIGuideLayoutController)guideLayoutController
{
  ObjectForKey = TUI::Util::PartialStruct::Storage::getObjectForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 0xBu);

  return (TUIGuideLayoutController *)ObjectForKey;
}

- (void)setFlexedWidth:(double)a3
{
  p_storage = (TUI::Util::PartialStruct::Storage::Header **)&self->_storage;
  double v6 = (float *)TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 6u);
  if (v6) {
    double v7 = *v6;
  }
  else {
    double v7 = NAN;
  }
  if (!TUICGFloatIsEqualFloatOrBothNaN(v7, a3))
  {
    float v8 = a3;
    DataForKey = (float *)TUI::Util::PartialStruct::Storage::allocateDataForKey(p_storage, 6u, 4uLL, 1);
    if (DataForKey) {
      float *DataForKey = v8;
    }
    [(TUILayout *)self invalidateLayout];
  }
}

- (double)flexedWidth
{
  id v2 = (float *)TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 6u);
  if (v2) {
    return *v2;
  }
  else {
    return NAN;
  }
}

- (void)setFlexedHeight:(double)a3
{
  p_storage = (TUI::Util::PartialStruct::Storage::Header **)&self->_storage;
  double v6 = (float *)TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 5u);
  if (v6) {
    double v7 = *v6;
  }
  else {
    double v7 = NAN;
  }
  if (!TUICGFloatIsEqualFloatOrBothNaN(v7, a3))
  {
    float v8 = a3;
    DataForKey = (float *)TUI::Util::PartialStruct::Storage::allocateDataForKey(p_storage, 5u, 4uLL, 1);
    if (DataForKey) {
      float *DataForKey = v8;
    }
    [(TUILayout *)self invalidateLayout];
  }
}

- (double)flexedHeight
{
  id v2 = (float *)TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 5u);
  if (v2) {
    return *v2;
  }
  else {
    return NAN;
  }
}

- (void)setContainingWidth:(double)a3
{
  p_storage = (TUI::Util::PartialStruct::Storage::Header **)&self->_storage;
  double v6 = (float *)TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 0);
  if (v6) {
    double v7 = *v6;
  }
  else {
    double v7 = NAN;
  }
  if (!TUICGFloatIsEqualFloatOrBothNaN(v7, a3))
  {
    float v8 = a3;
    DataForKey = (float *)TUI::Util::PartialStruct::Storage::allocateDataForKey(p_storage, 0, 4uLL, 1);
    if (DataForKey) {
      float *DataForKey = v8;
    }
    [(TUILayout *)self onContainingWidthChange];
    [(TUILayout *)self invalidateLayout];
  }
}

- (double)containingWidth
{
  id v2 = (float *)TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 0);
  if (v2) {
    return *v2;
  }
  else {
    return NAN;
  }
}

- (void)setContainingMaxWidth:(double)a3
{
  p_storage = (TUI::Util::PartialStruct::Storage::Header **)&self->_storage;
  double v6 = (float *)TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 2u);
  if (v6) {
    double v7 = *v6;
  }
  else {
    double v7 = NAN;
  }
  if (!TUICGFloatIsEqualFloatOrBothNaN(v7, a3))
  {
    float v8 = a3;
    DataForKey = (float *)TUI::Util::PartialStruct::Storage::allocateDataForKey(p_storage, 2u, 4uLL, 1);
    if (DataForKey) {
      float *DataForKey = v8;
    }
    [(TUILayout *)self invalidateLayout];
  }
}

- (double)containingMaxWidth
{
  id v2 = (float *)TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 2u);
  if (v2) {
    return *v2;
  }
  else {
    return NAN;
  }
}

- (void)setContainingHeight:(double)a3
{
  p_storage = (TUI::Util::PartialStruct::Storage::Header **)&self->_storage;
  double v6 = (float *)TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 7u);
  if (v6) {
    double v7 = *v6;
  }
  else {
    double v7 = NAN;
  }
  if (!TUICGFloatIsEqualFloatOrBothNaN(v7, a3))
  {
    float v8 = a3;
    DataForKey = (float *)TUI::Util::PartialStruct::Storage::allocateDataForKey(p_storage, 7u, 4uLL, 1);
    if (DataForKey) {
      float *DataForKey = v8;
    }
    [(TUILayout *)self invalidateLayout];
  }
}

- (double)containingHeight
{
  id v2 = (float *)TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 7u);
  if (v2) {
    return *v2;
  }
  else {
    return NAN;
  }
}

- (BOOL)isIntrinsicWidthInvalid
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (BOOL)isIntrinsicHeightInvalid
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (BOOL)isIntrinsicSizeInvalid
{
  return (*(unsigned char *)&self->_flags & 0x30) != 0;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)validatedIntrinsicWidthConsideringSpecified
{
  float v4 = [(TUILayout *)self specifiedWidth];
  uint64_t v6 = v5;
  float v8 = [(TUILayout *)self validatedIntrinsicWidth];

  return ($881BB7C90C7D0DFCC1492E3DC022A30F *)TUILengthCombineSpecifiedAndIntrinsic((uint64_t)v4, v6, (uint64_t)v8, v7);
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)validatedIntrinsicHeightConsideringSpecified
{
  float v4 = [(TUILayout *)self specifiedHeight];
  uint64_t v6 = v5;
  float v8 = [(TUILayout *)self validatedIntrinsicHeight];

  return ($881BB7C90C7D0DFCC1492E3DC022A30F *)TUILengthCombineSpecifiedAndIntrinsic((uint64_t)v4, v6, (uint64_t)v8, v7);
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computedWidth
{
  [(TUILayout *)self aspectConstrainedSpecifiedWidth];
  unint64_t v5 = v4 & 0x7000000000000;
  uint64_t v6 = [(TUILayout *)self aspectConstrainedSpecifiedWidth];
  if (v5 < 0x2000000000001)
  {
    [(TUILayout *)self computedContentWidthConsideringTransform];
    TUILengthComputedWithSpecifiedAndContent();
  }
  else
  {
    LODWORD(v7) = HIDWORD(v6);
    [(TUILayout *)self aspectConstrainedSpecifiedWidth];
    LODWORD(v9) = v8;
    unint64_t v10 = [(TUILayout *)self aspectConstrainedSpecifiedWidth];
    [(TUILayout *)self computedTransformedSize];
    if (v11 <= -3.40282347e38)
    {
      uint64_t v12 = 4286578687;
    }
    else
    {
      uint64_t v12 = 2139095039;
      BOOL v13 = v11 < 3.40282347e38;
      float v14 = v11;
      if (v13) {
        uint64_t v12 = LODWORD(v14);
      }
    }
    return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v12 | v10 & 0xFFFFFFFF00000000);
  }
  return result;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computedHeight
{
  [(TUILayout *)self aspectConstrainedSpecifiedHeight];
  unint64_t v5 = v4 & 0x7000000000000;
  uint64_t v6 = [(TUILayout *)self aspectConstrainedSpecifiedHeight];
  if (v5 < 0x2000000000001)
  {
    [(TUILayout *)self computedContentHeightConsideringTransform];
    TUILengthComputedWithSpecifiedAndContent();
  }
  else
  {
    LODWORD(v7) = HIDWORD(v6);
    [(TUILayout *)self aspectConstrainedSpecifiedHeight];
    LODWORD(v9) = v8;
    unint64_t v10 = [(TUILayout *)self aspectConstrainedSpecifiedHeight];
    [(TUILayout *)self computedTransformedSize];
    if (v11 <= -3.40282347e38)
    {
      uint64_t v12 = 4286578687;
    }
    else
    {
      uint64_t v12 = 2139095039;
      if (v11 < 3.40282347e38)
      {
        *(float *)&unsigned int v13 = v11;
        uint64_t v12 = v13;
      }
    }
    return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v12 | v10 & 0xFFFFFFFF00000000);
  }
  return result;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computedContentWidthConsideringTransform
{
  [(TUILayout *)self computedTransform];
  if (CGAffineTransformIsIdentity(&v8)) {
    return [(TUILayout *)self computedContentWidth];
  }
  [(TUILayout *)self computedTransformedSize];
  if (v5 <= -3.40282347e38)
  {
    uint64_t v7 = 4286578687;
  }
  else
  {
    if (v5 < 3.40282347e38)
    {
      *(float *)&unsigned int v6 = v5;
      return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v6 | 0x7FC0000000000000);
    }
    uint64_t v7 = 2139095039;
  }
  return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v7 & 0xFFFFFFFFFFFFLL | 0x7FC0000000000000);
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computedContentHeightConsideringTransform
{
  [(TUILayout *)self computedTransform];
  if (CGAffineTransformIsIdentity(&v8)) {
    return [(TUILayout *)self computedContentHeight];
  }
  [(TUILayout *)self computedTransformedSize];
  if (v5 <= -3.40282347e38)
  {
    uint64_t v7 = 4286578687;
  }
  else
  {
    if (v5 < 3.40282347e38)
    {
      *(float *)&unsigned int v6 = v5;
      return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v6 | 0x7FC0000000000000);
    }
    uint64_t v7 = 2139095039;
  }
  return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v7 & 0xFFFFFFFFFFFFLL | 0x7FC0000000000000);
}

- (double)computedHeightAbovePivot
{
  [(TUILayout *)self computedTransformedSize];
  return v2;
}

- (double)computedLeadingEdge
{
  return 0.0;
}

- (double)computedHorizontalCenter
{
  [(TUILayout *)self computedTransformedSize];
  return v2 * 0.5;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computedContentWidth
{
  [(TUILayout *)self computedTransformedSize];
  if (v3 <= -3.40282347e38)
  {
    uint64_t v6 = 4286578687;
  }
  else
  {
    if (v3 < 3.40282347e38)
    {
      *(float *)&unsigned int v4 = v3;
      return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v4 | 0x7FC0000000000000);
    }
    uint64_t v6 = 2139095039;
  }
  return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v6 & 0xFFFFFFFFFFFFLL | 0x7FC0000000000000);
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computedContentHeight
{
  [(TUILayout *)self computedTransformedSize];
  if (v3 <= -3.40282347e38)
  {
    uint64_t v6 = 4286578687;
  }
  else
  {
    if (v3 < 3.40282347e38)
    {
      *(float *)&unsigned int v4 = v3;
      return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v4 | 0x7FC0000000000000);
    }
    uint64_t v6 = 2139095039;
  }
  return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v6 & 0xFFFFFFFFFFFFLL | 0x7FC0000000000000);
}

- (CGRect)computedFrame
{
  [(TUILayout *)self computedBounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(TUILayout *)self _computedFrameTransform];
  v12.origin.x = v4;
  v12.origin.y = v6;
  v12.size.width = v8;
  v12.size.height = v10;
  return CGRectApplyAffineTransform(v12, &v11);
}

- (CGRect)computedBounds
{
  double width = self->_computedNaturalSize.width;
  double height = self->_computedNaturalSize.height;
  double v4 = 0.0;
  double v5 = 0.0;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)computedBoundsWithFlags:(unint64_t)a3
{
  -[TUILayout computedBoundsPrimitiveWithFlags:](self, "computedBoundsPrimitiveWithFlags:");
  CGFloat x = v5;
  CGFloat y = v7;
  CGFloat width = v9;
  CGFloat height = v11;
  if (a3)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    unsigned int v13 = [(TUILayout *)self computedBoundsChildrenWithFlags:a3];
    id v14 = [v13 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v32;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v32 != v15) {
            objc_enumerationMutation(v13);
          }
          uint64_t v17 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          [v17 computedBoundsWithFlags:a3];
          CGFloat v22 = v21;
          if (v21 > 0.0)
          {
            CGFloat v23 = v20;
            if (v20 > 0.0)
            {
              CGFloat v24 = v18;
              CGFloat v25 = v19;
              memset(&v30[1], 0, sizeof(CGAffineTransform));
              if (v17) {
                [v17 _computedFrameTransform];
              }
              v30[0] = v30[1];
              v36.origin.CGFloat x = v24;
              v36.origin.CGFloat y = v25;
              v36.size.CGFloat width = v22;
              v36.size.CGFloat height = v23;
              CGRect v40 = CGRectApplyAffineTransform(v36, v30);
              v37.origin.CGFloat x = x;
              v37.origin.CGFloat y = y;
              v37.size.CGFloat width = width;
              v37.size.CGFloat height = height;
              CGRect v38 = CGRectUnion(v37, v40);
              CGFloat x = v38.origin.x;
              CGFloat y = v38.origin.y;
              CGFloat width = v38.size.width;
              CGFloat height = v38.size.height;
            }
          }
        }
        id v14 = [v13 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v14);
    }
  }
  double v26 = x;
  double v27 = y;
  double v28 = width;
  double v29 = height;
  result.size.CGFloat height = v29;
  result.size.CGFloat width = v28;
  result.origin.CGFloat y = v27;
  result.origin.CGFloat x = v26;
  return result;
}

- (CGRect)computedBoundsPrimitiveWithFlags:(unint64_t)a3
{
  double v3 = 0.0;
  double v4 = fmax(self->_computedNaturalSize.width, 0.0);
  double v5 = fmax(self->_computedNaturalSize.height, 0.0);
  double v6 = 0.0;
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v6;
  result.origin.CGFloat x = v3;
  return result;
}

- (double)computedScale
{
  double v2 = [(TUILayout *)self layoutAncestor];
  double v3 = v2;
  if (v2)
  {
    [v2 computedScale];
    double v5 = v4;
  }
  else
  {
    double v5 = 1.0;
  }

  return v5;
}

- (void)onComputedScaleDidChange
{
  [(TUILayout *)self invalidateLayout];

  [(TUILayout *)self notifyChildrenScaleDidChange];
}

- (void)notifyChildrenScaleDidChange
{
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  double v2 = [(TUILayout *)self children];
  id v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v7;
    do
    {
      double v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v6 + 1) + 8 * (void)v5) onComputedScaleDidChange];
        double v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (CGAffineTransform)_computedFrameTransform
{
  [(TUILayout *)self specifiedTransform];
  CGAffineTransformMakeTranslation(&v6, self->_computedOrigin.x, self->_computedOrigin.y);
  return CGAffineTransformConcat(retstr, &t1, &v6);
}

- (CGAffineTransform)computedTransformInAncestorLayout:(SEL)a3
{
  CGAffineTransform v6 = (TUILayout *)a4;
  if (v6 == self)
  {
    long long v12 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&retstr->c = v12;
    *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tCGFloat x = 0u;
    *(_OWORD *)&retstr->a = 0u;
    [(TUILayout *)self _computedFrameTransform];
    uint64_t v7 = [(TUILayout *)self layoutAncestor];
    long long v8 = (void *)v7;
    if (!v7 || (TUILayout *)v7 == v6)
    {
      double v11 = (TUILayout *)v7;
    }
    else
    {
      do
      {
        long long v9 = *(_OWORD *)&retstr->c;
        *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
        *(_OWORD *)&t1.c = v9;
        *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&retstr->tx;
        [v8 _computedFrameTransform];
        CGAffineTransformConcat(&v16, &t1, &v14);
        long long v10 = *(_OWORD *)&v16.c;
        *(_OWORD *)&retstr->a = *(_OWORD *)&v16.a;
        *(_OWORD *)&retstr->c = v10;
        *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&v16.tx;
        double v11 = [v8 layoutAncestor];

        if (!v11) {
          break;
        }
        long long v8 = v11;
      }
      while (v11 != v6);
    }
  }
  return result;
}

- (CGSize)computedTransformedSize
{
  memset(&v14, 0, sizeof(v14));
  [(TUILayout *)self computedTransform];
  CGSize computedNaturalSize = self->_computedNaturalSize;
  long long v3 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&t1.c = v3;
  *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  CGAffineTransform t2 = v14;
  if (CGAffineTransformEqualToTransform(&t1, &t2))
  {
    float64x2_t v4 = (float64x2_t)computedNaturalSize;
  }
  else
  {
    [(TUILayout *)self computedTransform];
    TUITransformedCornersOfRect(v7, v11.f64, v9.f64, v8.f64, v10.f64, 0.0, 0.0, computedNaturalSize.width, computedNaturalSize.height);
    float64x2_t v4 = vsubq_f64(vmaxnmq_f64(vmaxnmq_f64(v11, v10), vmaxnmq_f64(v9, v8)), vminnmq_f64(vminnmq_f64(v11, v10), vminnmq_f64(v9, v8)));
  }
  double v5 = v4.f64[1];
  result.CGFloat width = v4.f64[0];
  result.CGFloat height = v5;
  return result;
}

- (CGRect)computedErasableBounds
{
  [(TUILayout *)self computedErasableBoundsPrimitive];
  CGFloat x = v3;
  CGFloat y = v5;
  CGFloat width = v7;
  CGFloat height = v9;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  float64x2_t v11 = [(TUILayout *)self children];
  id v12 = [v11 countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v46;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v46 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        if (([v15 hidden] & 1) == 0)
        {
          [v15 computedErasableBounds];
          CGFloat v34 = v17;
          CGFloat v35 = v16;
          CGFloat v19 = v18;
          CGFloat v21 = v20;
          [v15 computedTransformedSize];
          double v23 = v22;
          double v25 = v24;
          memset(&v44, 0, sizeof(v44));
          CGAffineTransformMakeTranslation(&v44, -(v22 * 0.5), -(v24 * 0.5));
          CGAffineTransform t1 = v44;
          if (v15) {
            [v15 renderTransform];
          }
          else {
            memset(&t2, 0, sizeof(t2));
          }
          CGAffineTransformConcat(&v43, &t1, &t2);
          CGAffineTransform v44 = v43;
          CGAffineTransform v40 = v43;
          if (v15) {
            [v15 computedTransform];
          }
          else {
            memset(&v39, 0, sizeof(v39));
          }
          CGFloat r1 = height;
          CGAffineTransformConcat(&v43, &v40, &v39);
          CGAffineTransform v44 = v43;
          CGAffineTransform v38 = v43;
          [v15 computedOrigin];
          double v27 = v26;
          [v15 computedOrigin];
          CGAffineTransformMakeTranslation(&v37, v23 * 0.5 + v27, v25 * 0.5 + v28);
          CGAffineTransformConcat(&v43, &v38, &v37);
          CGAffineTransform v44 = v43;
          CGAffineTransform v36 = v43;
          v50.origin.CGFloat x = v19;
          v50.origin.CGFloat y = v21;
          v50.size.CGFloat height = v34;
          v50.size.CGFloat width = v35;
          CGRect v54 = CGRectApplyAffineTransform(v50, &v36);
          v51.origin.CGFloat x = x;
          v51.origin.CGFloat y = y;
          v51.size.CGFloat width = width;
          v51.size.CGFloat height = r1;
          CGRect v52 = CGRectUnion(v51, v54);
          CGFloat x = v52.origin.x;
          CGFloat y = v52.origin.y;
          CGFloat width = v52.size.width;
          CGFloat height = v52.size.height;
        }
      }
      id v12 = [v11 countByEnumeratingWithState:&v45 objects:v49 count:16];
    }
    while (v12);
  }

  double v29 = x;
  double v30 = y;
  double v31 = width;
  double v32 = height;
  result.size.CGFloat height = v32;
  result.size.CGFloat width = v31;
  result.origin.CGFloat y = v30;
  result.origin.CGFloat x = v29;
  return result;
}

- (double)computeIntrinsicAspectRatio
{
  return NAN;
}

- (double)computeDerivedWidth
{
  [(TUILayout *)self computeIntrinsicAspectRatio];
  double v4 = v3;
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  [(TUILayout *)self computeHeightWithoutDerived];
  if (v4 <= 0.0) {
    return NAN;
  }
  else {
    return left + right + (v8 - (UIEdgeInsetsZero.top + bottom)) / v4;
  }
}

- (double)computeDerivedHeight
{
  [(TUILayout *)self computeIntrinsicAspectRatio];
  double v4 = v3;
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  [(TUILayout *)self computeWidthWithoutDerived];
  if (v4 <= 0.0) {
    return NAN;
  }
  else {
    return UIEdgeInsetsZero.top + bottom + v4 * (v8 - (left + right));
  }
}

- (double)computeWidthWithoutDerived
{
  [(TUILayout *)self _computeWidth:0];
  return result;
}

- (double)computeWidth
{
  [(TUILayout *)self _computeWidth:1];
  return result;
}

- (double)_computeWidth:(BOOL)a3
{
  [(TUILayout *)self specifiedWidth];
  uint64_t v5 = v4;
  CGAffineTransform v6 = (float *)TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 0);
  if (v6) {
    double v7 = *v6;
  }
  else {
    double v7 = NAN;
  }
  double v8 = (float *)TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 6u);
  if (v8) {
    double v9 = *v8;
  }
  else {
    double v9 = NAN;
  }
  float64x2_t v10 = (float *)TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 2u);
  if (v10) {
    double v11 = *v10;
  }
  else {
    double v11 = NAN;
  }
  [(TUILayout *)self constrainComputedWidth:v9];
  double v13 = v12;
  double v14 = fmin(v12, v7);
  if ((v5 & 0x7000000000000) == 0x6000000000000) {
    double v14 = v13;
  }
  double v15 = fmin(v14, v11);
  if ((v5 & 0x7000000000000) == 0x6000000000000) {
    return v13;
  }
  return v15;
}

- (double)computeHeightWithoutDerived
{
  [(TUILayout *)self _computeHeight:0];
  return result;
}

- (double)computeHeight
{
  [(TUILayout *)self _computeHeight:1];
  return result;
}

- (double)_computeHeight:(BOOL)a3
{
  uint64_t v4 = [(TUILayout *)self specifiedHeight];
  float v6 = v5;
  TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 7u);
  double v7 = (float *)TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->_storage, 5u);
  if (v7)
  {
    int v8 = 0;
    double v9 = *v7;
  }
  else
  {
    double v9 = *(float *)&v4;
    int v8 = 1;
  }
  [(TUILayout *)self constrainComputedHeight:v9];
  if (v8) {
    return fmin(fmax(result, *((float *)&v4 + 1)), v6);
  }
  return result;
}

- (void)computeLayout
{
  [(TUILayout *)self computeWidth];
  double v4 = v3;
  [(TUILayout *)self computeHeight];

  -[TUILayout setComputedNaturalSize:](self, "setComputedNaturalSize:", v4, v5);
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)aspectConstrainedSpecifiedWidth
{
  unint64_t v4 = [(TUILayout *)self specifiedWidth];
  unsigned int v5 = v4;
  unint64_t v6 = HIDWORD(v4);
  if ((*((unsigned char *)&self->_flags + 1) & 0x30) != 0)
  {
    [(TUILayout *)self computeIntrinsicAspectRatio];
    if (v7 > 0.0)
    {
      double v8 = v7;
      double v9 = [(TUILayout *)self specifiedHeight];
      if ((*(_DWORD *)&self->_flags & 0x1000) != 0)
      {
        float v10 = fmin(*(float *)&v6, fmaxf(*(float *)&v9, *((float *)&v9 + 1)) / v8);
        *(float *)&unint64_t v6 = v10;
      }
    }
  }
  return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v5 | ((unint64_t)v6 << 32));
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)aspectConstrainedSpecifiedHeight
{
  unint64_t v4 = [(TUILayout *)self specifiedHeight];
  unsigned int v5 = v4;
  unint64_t v6 = HIDWORD(v4);
  if ((*((unsigned char *)&self->_flags + 1) & 0xC0) != 0)
  {
    [(TUILayout *)self computeIntrinsicAspectRatio];
    if (v7 > 0.0)
    {
      double v8 = v7;
      double v9 = [(TUILayout *)self specifiedWidth];
      if ((*(_DWORD *)&self->_flags & 0x4000) != 0)
      {
        float v10 = fmax(*(float *)&v6, v8 * fmaxf(*(float *)&v9, *((float *)&v9 + 1)));
        *(float *)&unint64_t v6 = v10;
      }
    }
  }
  return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v5 | ((unint64_t)v6 << 32));
}

- (void)_computeAspectConstrainedSpecifiedWidthHeight
{
  double v3 = [(TUILayout *)self specifiedWidth];
  float v5 = v4;
  unint64_t v6 = [(TUILayout *)self specifiedHeight];
  *(float *)&double v7 = v5;
  *(float *)&double v8 = fminf(*(float *)&v3, v5);
  LODWORD(v9) = HIDWORD(v3);
  *(float *)&double v10 = fmaxf(*(float *)&v3, *((float *)&v3 + 1));
  *(float *)&double v12 = v11;
  *(float *)&double v13 = fminf(*(float *)&v6, v11);
  *(float *)&double v14 = fmaxf(*(float *)&v6, *((float *)&v6 + 1));
  [(TUILayout *)self computeIntrinsicAspectRatio];
  if (v15 > 0.0)
  {
    $2E822BB417F7D1609F669B00B90D7CC3 flags = self->_flags;
    p_$2E822BB417F7D1609F669B00B90D7CC3 flags = &self->_flags;
    unsigned int v19 = *(_DWORD *)&flags & 0xFFFF0FFF | 0x7000;
    int v16 = 0x8000;
  }
  else
  {
    int v16 = 0;
    $2E822BB417F7D1609F669B00B90D7CC3 v18 = self->_flags;
    p_$2E822BB417F7D1609F669B00B90D7CC3 flags = &self->_flags;
    unsigned int v19 = *(_DWORD *)&v18 & 0xFFFF0FFF;
  }
  *p_$2E822BB417F7D1609F669B00B90D7CC3 flags = ($2E822BB417F7D1609F669B00B90D7CC3)(v16 | v19);
}

- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4
{
  return 0;
}

- (void)appendChildRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4 transform:(CGAffineTransform *)a5 toModels:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  double v12 = [(TUILayout *)self children];
  long long v13 = *(_OWORD *)&a5->c;
  v14[0] = *(_OWORD *)&a5->a;
  v14[1] = v13;
  v14[2] = *(_OWORD *)&a5->tx;
  [(TUILayout *)self appendChilden:v12 renderModelCompatibleWithKind:a3 context:v10 transform:v14 toModels:v11];
}

- (void)appendChilden:(id)a3 renderModelCompatibleWithKind:(unint64_t)a4 context:(id)a5 transform:(CGAffineTransform *)a6 toModels:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  [(TUILayout *)self computedNaturalSize];
  double v16 = v15;
  double v18 = v17;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v19 = v12;
  id v20 = [v19 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v38;
    double v22 = -v16;
    double v23 = -v18;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v38 != v21) {
          objc_enumerationMutation(v19);
        }
        double v25 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        [v25 computedOrigin];
        double v27 = v26;
        double v29 = v28;
        [v25 computedTransformedSize];
        memset(&v36, 0, sizeof(v36));
        CGAffineTransformMakeTranslation(&t1, v27 + v30 * 0.5 + v22 * 0.5, v29 + v31 * 0.5 + v23 * 0.5);
        long long v32 = *(_OWORD *)&a6->c;
        *(_OWORD *)&t2.a = *(_OWORD *)&a6->a;
        *(_OWORD *)&t2.c = v32;
        *(_OWORD *)&t2.tCGFloat x = *(_OWORD *)&a6->tx;
        CGAffineTransformConcat(&v36, &t1, &t2);
        CGAffineTransform v33 = v36;
        [v25 appendRenderModelCompatibleWithKind:a4 context:v13 transform:&v33 toModels:v14];
      }
      id v20 = [v19 countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v20);
  }
}

- (id)scrollAncestorForChildrenWithAncestor:(id)a3
{
  id v3 = a3;

  return v3;
}

- (id)rootLayout
{
  double v2 = self;
  id v3 = [(TUILayout *)v2 layoutAncestor];
  while (v3)
  {
    float v4 = v2;
    double v2 = v3;

    id v3 = [(TUILayout *)v2 layoutAncestor];
  }

  return v2;
}

- (id)axModelTreeWithCustomActionsCollector:(id)a3 scrollAncestorLayout:(id)a4 scrollAncestorTranslation:(CGPoint)a5 liveTransformAncestorLayout:(id)a6
{
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  v95 = (TUIAXCustomActionsCollector *)a3;
  v84 = (TUILayout *)a4;
  v85 = (TUILayout *)a6;
  v86 = [(TUILayout *)self box];
  v87 = self;
  id v11 = [(TUILayout *)self scrollAncestorForChildrenWithAncestor:v84];
  double v12 = y;
  double v13 = x;
  v93 = v11;
  if (v11 != v84)
  {
    [(TUILayout *)v11 scrollAdditionalAXTranslation];
    double v13 = v14;
    double v12 = v15;
  }
  id v16 = [v86 liveTransformKind];
  double v17 = v85;
  if (v16) {
    double v17 = self;
  }
  v92 = v17;
  double v18 = [TUIAXModel alloc];
  id v19 = [v86 identifier];
  id v20 = [(id)objc_opt_class() description];
  v88 = [(TUIAXModel *)v18 initWithIdentifier:v19 boxType:v20];

  [(TUIAXModel *)v88 setHidden:[(TUILayout *)self hidden]];
  v90 = objc_opt_new();
  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  id obj = [(TUILayout *)self children];
  id v21 = [obj countByEnumeratingWithState:&v109 objects:v115 count:16];
  if (v21)
  {
    uint64_t v91 = *(void *)v110;
    do
    {
      id v94 = v21;
      for (i = 0; i != v94; i = (char *)i + 1)
      {
        if (*(void *)v110 != v91) {
          objc_enumerationMutation(obj);
        }
        double v23 = *(void **)(*((void *)&v109 + 1) + 8 * i);
        double v24 = [v23 box];
        unsigned int v25 = [v24 isAXElement];
        if (v95) {
          unsigned int v26 = 0;
        }
        else {
          unsigned int v26 = v25;
        }

        if (v26) {
          double v27 = objc_alloc_init(TUIAXCustomActionsCollector);
        }
        else {
          double v27 = 0;
        }
        if (v95) {
          double v29 = v95;
        }
        else {
          double v29 = v27;
        }
        double v30 = [v23 axModelTreeWithCustomActionsCollector:v29 scrollAncestorLayout:v93 scrollAncestorTranslation:v92 liveTransformAncestorLayout:v13];
        rect[0] = v30;
        if (v27)
        {
          double v31 = [v23 box];
          long long v32 = [v31 axCustomActions];
          BOOL v33 = [v32 count] == 0;

          if (v33)
          {
            CGAffineTransform v43 = [(TUIAXCustomActionsCollector *)v27 customActionsForPress];
            BOOL v44 = [v43 count] == 0;

            if (v44) {
              goto LABEL_36;
            }
            long long v45 = [(TUIAXCustomActionsCollector *)v27 customActionsForPress];
            CGFloat v34 = [v45 firstObject];

            [v34 setIsDefault:1];
            v113 = v34;
            long long v46 = +[NSArray arrayWithObjects:&v113 count:1];
            [v30 setResolvedCustomActions:v46];
          }
          else
          {
            CGFloat v34 = objc_opt_new();
            long long v107 = 0u;
            long long v108 = 0u;
            long long v105 = 0u;
            long long v106 = 0u;
            CGFloat v35 = [v23 box];
            CGAffineTransform v36 = [v35 axCustomActions];

            id v37 = [v36 countByEnumeratingWithState:&v105 objects:v114 count:16];
            if (v37)
            {
              uint64_t v38 = *(void *)v106;
              do
              {
                for (j = 0; j != v37; j = (char *)j + 1)
                {
                  if (*(void *)v106 != v38) {
                    objc_enumerationMutation(v36);
                  }
                  id v40 = *(id *)(*((void *)&v105 + 1) + 8 * (void)j);
                  if ([v40 isReference])
                  {
                    v41 = [v40 dereferenceByCollector:v27];
                    if (v41)
                    {
                      id v42 = [v40 copyFromReference:v41];

                      id v40 = v42;
                    }
                  }
                  [v34 addObject:v40];
                }
                id v37 = [v36 countByEnumeratingWithState:&v105 objects:v114 count:16];
              }
              while (v37);
            }

            [rect[0] setResolvedCustomActions:v34];
          }
        }
LABEL_36:
        if (rect[0]) {
          [v90 addObject:rect[0]];
        }
      }
      id v21 = [obj countByEnumeratingWithState:&v109 objects:v115 count:16];
    }
    while (v21);
  }

  [(TUIAXModel *)v88 setChildren:v90];
  unsigned int v47 = [v86 axHasNonDefaultAttributess];
  if (v47) {
    long long v48 = [[TUIAXAttributes alloc] initWithAXAttributes:v86];
  }
  else {
    long long v48 = 0;
  }
  [(TUIAXModel *)v88 setAxAttributes:v48];
  if (v47) {

  }
  v49 = [(TUILayout *)v84 box];
  CGRect v50 = [v49 identifier];
  [(TUIAXModel *)v88 setScrollAncestorIdentifier:v50];

  if (v93 == v87) {
    CGRect v51 = (char *)[(TUILayout *)v87 scrollAxis];
  }
  else {
    CGRect v51 = 0;
  }
  [(TUIAXModel *)v88 setShouldScrollHorizontally:v51 == (unsigned char *)&def_141F14 + 1];
  [(TUIAXModel *)v88 setShouldScrollVertically:v51 == (unsigned char *)&def_141F14 + 2];
  CGRect v52 = [(TUILayout *)v85 box];
  v53 = [v52 identifier];
  [(TUIAXModel *)v88 setLiveTransformAncestorIdentifier:v53];

  -[TUIAXModel setLiveTransformKind:](v88, "setLiveTransformKind:", [v86 liveTransformKind]);
  memset(&v104, 0, sizeof(v104));
  [(TUILayout *)v87 computedTransformInAncestorLayout:v84];
  CGAffineTransform v102 = v104;
  CGAffineTransformTranslate(&v103, &v102, x, y);
  CGAffineTransform v104 = v103;
  [(TUILayout *)v87 computedBounds];
  v55 = v54;
  CGFloat v57 = v56;
  CGFloat v59 = v58;
  CGFloat v61 = v60;
  v62 = [(TUILayout *)v87 computedLayoutDirection];
  [(TUIAXModel *)v88 setFlipsHorizontal:v62 == (unsigned char *)&def_141F14 + 2];
  if (v62 == (unsigned char *)&def_141F14 + 2)
  {
    if (v84)
    {
      v63 = v84;
    }
    else
    {
      v63 = [(TUILayout *)v87 rootLayout];
    }
    v64 = v63;
    rect[0] = v55;
    [(TUILayout *)v63 computedBounds];
    CGFloat v66 = v65;
    CGFloat v68 = v67;
    CGFloat v70 = v69;
    CGFloat v72 = v71;
    CGAffineTransform v100 = v104;
    CGAffineTransformInvert(&v101, &v100);
    v119.origin.CGFloat x = v66;
    v119.origin.CGFloat y = v68;
    v119.size.CGFloat width = v70;
    v119.size.CGFloat height = v72;
    CGRect v120 = CGRectApplyAffineTransform(v119, &v101);
    CGFloat v73 = v120.origin.x;
    CGFloat v74 = v120.origin.y;
    CGFloat width = v120.size.width;
    CGFloat height = v120.size.height;
    double MinX = CGRectGetMinX(v120);
    v121.origin.CGFloat x = v73;
    v121.origin.CGFloat y = v74;
    v121.size.CGFloat width = width;
    v121.size.CGFloat height = height;
    CGFloat MaxX = CGRectGetMaxX(v121);
    CGAffineTransformMakeTranslation(&v99, -(MinX + MaxX), 0.0);
    *(id *)&v122.origin.CGFloat x = rect[0];
    v122.origin.CGFloat y = v57;
    v122.size.CGFloat width = v59;
    v122.size.CGFloat height = v61;
    CGRect v123 = CGRectApplyAffineTransform(v122, &v99);
    CGFloat v79 = v123.origin.x;
    CGFloat v80 = v123.origin.y;
    CGFloat v81 = v123.size.width;
    CGFloat v82 = v123.size.height;
    CGAffineTransformMakeScale(&v98, -1.0, 1.0);
    v124.origin.CGFloat x = v79;
    v124.origin.CGFloat y = v80;
    v124.size.CGFloat width = v81;
    v124.size.CGFloat height = v82;
    CGRect v125 = CGRectApplyAffineTransform(v124, &v98);
    CGAffineTransform v97 = v104;
    CGRect v126 = CGRectApplyAffineTransform(v125, &v97);
    -[TUIAXModel setAccessibilityFrameRelativeToScrollAncestor:](v88, "setAccessibilityFrameRelativeToScrollAncestor:", v126.origin.x, v126.origin.y, v126.size.width, v126.size.height);
  }
  else
  {
    *(CGAffineTransform *)&rect[1] = v104;
    *(void *)&v117.origin.CGFloat x = v55;
    v117.origin.CGFloat y = v57;
    v117.size.CGFloat width = v59;
    v117.size.CGFloat height = v61;
    CGRect v118 = CGRectApplyAffineTransform(v117, (CGAffineTransform *)&rect[1]);
    -[TUIAXModel setAccessibilityFrameRelativeToScrollAncestor:](v88, "setAccessibilityFrameRelativeToScrollAncestor:", v118.origin.x, v118.origin.y, v118.size.width, v118.size.height);
  }

  return v88;
}

- (id)_transformedRenderModel:(id)a3 transform:(CGAffineTransform *)a4 context:(id)a5 allowCache:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a5;
  double y = CGPointZero.y;
  double a = a4->a;
  double b = a4->b;
  tCGFloat x = a4->tx;
  double c = a4->c;
  tdouble y = a4->ty;
  double d = a4->d;
  [v10 size];
  double v13 = v12;
  [v10 size];
  double v15 = v14;
  double v17 = a4->a;
  double v16 = a4->b;
  double v18 = a4->c;
  double v19 = a4->d;
  double v20 = a4->tx;
  double v21 = a4->ty;
  [v11 contentsScale];
  double v22 = v13 * -0.5;
  double v23 = v20 + v15 * -0.5 * v18 + v17 * (v13 * -0.5);
  double v24 = v21 + v15 * -0.5 * v19 + v16 * v22;
  double v26 = tx + y * c + a * CGPointZero.x + TUIPointRoundedForScale(v23, v24, v25) - v23;
  double v28 = ty + y * d + b * CGPointZero.x + v27 - v24;
  long long v29 = *(_OWORD *)&a4->c;
  *(_OWORD *)&t1.double a = *(_OWORD *)&a4->a;
  *(_OWORD *)&t1.double c = v29;
  *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&a4->tx;
  memset(&v61, 0, sizeof(v61));
  CGAffineTransformMakeTranslation(&t2, -v26, -v28);
  CGAffineTransformConcat(&v61, &t1, &t2);
  double v30 = v61.tx;
  [v11 contentsScale];
  v61.tCGFloat x = TUIFloatRoundedForScale(v30, v31);
  double v32 = v61.ty;
  [v11 contentsScale];
  v61.tdouble y = TUIFloatRoundedForScale(v32, v33);
  int64_t v34 = [(TUILayout *)self computeZIndexWithDefault:0];
  if (!v6) {
    goto LABEL_20;
  }
  cachedTransformModel = self->_cachedTransformModel;
  if (!cachedTransformModel || (*(unsigned char *)&self->_flags & 0x40) != 0) {
    goto LABEL_20;
  }
  CGAffineTransform v36 = 0;
  id v37 = [(TUIRenderModelTransform *)cachedTransformModel submodel];
  if (v37 != v10)
  {
    CGAffineTransform v36 = [(TUIRenderModelTransform *)self->_cachedTransformModel submodel];
    if (![v36 isEqual:v10]) {
      goto LABEL_18;
    }
  }
  [(TUIRenderModelTransform *)self->_cachedTransformModel center];
  if (v39 != v26 || v38 != v28) {
    goto LABEL_17;
  }
  v41 = self->_cachedTransformModel;
  if (v41) {
    [(TUIRenderModelTransform *)v41 transform];
  }
  else {
    memset(&v58, 0, sizeof(v58));
  }
  CGAffineTransform v57 = v61;
  if (!CGAffineTransformEqualToTransform(&v58, &v57))
  {
LABEL_17:
    CGAffineTransform v43 = v10;
    if (v37 == v10)
    {
LABEL_19:

      goto LABEL_20;
    }
LABEL_18:

    CGAffineTransform v43 = v37;
    goto LABEL_19;
  }
  int64_t v42 = [(TUIRenderModelTransform *)self->_cachedTransformModel zIndex];
  if (v37 == v10)
  {
  }
  else
  {
  }
  if (v42 == v34)
  {
    BOOL v44 = self->_cachedTransformModel;
    goto LABEL_22;
  }
LABEL_20:
  BOOL v44 = [[TUIRenderModelTransform alloc] initWithSubmodel:v10];
  -[TUIRenderModelTransform setCenter:](v44, "setCenter:", v26, v28);
  CGAffineTransform v56 = v61;
  [(TUIRenderModelTransform *)v44 setTransform:&v56];
  [(TUIRenderModelTransform *)v44 setZIndex:v34];
  long long v45 = [(TUILayout *)self computedRefIdWithContext:v11];
  [(TUIRenderModelTransform *)v44 setRefId:v45];

  long long v46 = [(TUILayout *)self computedRefInstanceWithContext:v11];
  [(TUIRenderModelTransform *)v44 setRefInstance:v46];

  unsigned int v47 = [(TUILayout *)self box];
  [v47 renderOutsets];
  -[TUIRenderModelTransform setOutsets:](v44, "setOutsets:");

  if (v6)
  {
    *(_DWORD *)&self->_flags &= ~0x40u;
    objc_storeStrong((id *)&self->_cachedTransformModel, v44);
  }
LABEL_22:

  return v44;
}

- (BOOL)shouldAppendChildRenderModels
{
  return 0;
}

- (BOOL)shouldUseSubviewRenderModelWithContext:(id)a3
{
  float v4 = [a3 currentPointer];
  float v5 = [v4 refId];
  BOOL v6 = [(TUILayout *)self box];
  double v7 = [v6 refId];
  unsigned __int8 v8 = [v5 isEqualToString:v7];

  return v8;
}

- (void)appendRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4 transform:(CGAffineTransform *)a5 toModels:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  if (![(TUILayout *)self hidden])
  {
    long long v12 = *(_OWORD *)&a5->c;
    v13[0] = *(_OWORD *)&a5->a;
    v13[1] = v12;
    v13[2] = *(_OWORD *)&a5->tx;
    [(TUILayout *)self appendRenderModelIgnoreHiddenCompatibleWithKind:a3 context:v10 transform:v13 toModels:v11];
  }
}

- (void)appendRenderModelIgnoreHiddenCompatibleWithKind:(unint64_t)a3 context:(id)a4 transform:(CGAffineTransform *)a5 toModels:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  [(TUILayout *)self computedTransform];
  long long v12 = *(_OWORD *)&a5->c;
  *(_OWORD *)&t2.double a = *(_OWORD *)&a5->a;
  *(_OWORD *)&t2.double c = v12;
  *(_OWORD *)&t2.tCGFloat x = *(_OWORD *)&a5->tx;
  CGAffineTransformConcat(&v36, &t1, &t2);
  long long v13 = *(_OWORD *)&v36.c;
  *(_OWORD *)&a5->double a = *(_OWORD *)&v36.a;
  *(_OWORD *)&a5->double c = v13;
  *(_OWORD *)&a5->tCGFloat x = *(_OWORD *)&v36.tx;
  [(TUILayout *)self renderTransform];
  long long v14 = *(_OWORD *)&a5->c;
  *(_OWORD *)&v32.double a = *(_OWORD *)&a5->a;
  *(_OWORD *)&v32.double c = v14;
  *(_OWORD *)&v32.tCGFloat x = *(_OWORD *)&a5->tx;
  CGAffineTransformConcat(&v36, &v33, &v32);
  long long v15 = *(_OWORD *)&v36.c;
  *(_OWORD *)&a5->double a = *(_OWORD *)&v36.a;
  *(_OWORD *)&a5->double c = v15;
  *(_OWORD *)&a5->tCGFloat x = *(_OWORD *)&v36.tx;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10DC34;
  v28[3] = &unk_2558B0;
  v28[4] = self;
  id v16 = v10;
  id v29 = v16;
  id v17 = v11;
  id v30 = v17;
  unint64_t v31 = a3;
  double v18 = objc_retainBlock(v28);
  double v19 = [v16 currentLiveTransform];
  if (v19)
  {
  }
  else
  {
    long long v22 = *(_OWORD *)&a5->c;
    v27[0] = *(_OWORD *)&a5->a;
    v27[1] = v22;
    v27[2] = *(_OWORD *)&a5->tx;
    id v23 = [(TUILayout *)self newLiveTransform:v27];
    if (v23)
    {
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10DFE8;
      v25[3] = &unk_2558D8;
      v25[4] = self;
      double v26 = v18;
      [v16 evaluateWithLiveTransform:v23 block:v25];

      goto LABEL_6;
    }
  }
  long long v20 = *(_OWORD *)&a5->tx;
  long long v21 = *(_OWORD *)&a5->a;
  v24[1] = *(_OWORD *)&a5->c;
  v24[2] = v20;
  v24[0] = v21;
  ((void (*)(void *, _OWORD *, uint64_t))v18[2])(v18, v24, 1);
LABEL_6:
}

- (id)newLiveTransform:(CGAffineTransform *)a3
{
  float64x2_t v4 = *(float64x2_t *)&a3->c;
  float64x2_t v5 = vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(v4, CGPointZero.y), *(float64x2_t *)&a3->a, CGPointZero.x));
  *(_OWORD *)&t1.double a = *(_OWORD *)&a3->a;
  *(float64x2_t *)&t1.double c = v4;
  *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&a3->tx;
  memset(&v25, 0, sizeof(v25));
  float64x2_t v19 = v5;
  double v6 = v5.f64[1];
  CGAffineTransformMakeTranslation(&t2, -v5.f64[0], -v5.f64[1]);
  CGAffineTransformConcat(&v25, &t1, &t2);
  [(TUILayout *)self computedTransformedSize];
  double v8 = v7;
  double v10 = v9;
  id v11 = [(TUILayout *)self box];
  long long v12 = (char *)[v11 liveTransformKind];

  if ((unint64_t)(v12 - 2) < 5)
  {
    long long v13 = [(TUILayout *)self box];
    unint64_t v14 = -[TUILayout pinPositionFromLiveTransformKind:](self, "pinPositionFromLiveTransformKind:", [v13 liveTransformKind]);

    long long v15 = [TUIPinningLiveTransform alloc];
    CGAffineTransform v21 = v25;
    return -[TUIPinningLiveTransform initWithCenter:size:transform:pinPosition:](v15, "initWithCenter:size:transform:pinPosition:", &v21, v14, v19.f64[0], v6, v8, v10);
  }
  if (v12 == (unsigned char *)&def_141F14 + 1)
  {
    id v17 = [TUIFloatingLiveTransform alloc];
    CGAffineTransform v22 = v25;
    double v18 = &v22;
    return -[TUIFloatingLiveTransform initWithCenter:size:transform:](v17, "initWithCenter:size:transform:", v18, v19.f64[0], v6, v8, v10, *(_OWORD *)&v19, *(_OWORD *)&v20.a, *(_OWORD *)&v20.c, *(_OWORD *)&v20.tx);
  }
  if (v12 == (unsigned char *)&dword_4 + 3)
  {
    id v17 = [TUIOverscrollingLiveTransform alloc];
    CGAffineTransform v20 = v25;
    double v18 = &v20;
    return -[TUIFloatingLiveTransform initWithCenter:size:transform:](v17, "initWithCenter:size:transform:", v18, v19.f64[0], v6, v8, v10, *(_OWORD *)&v19, *(_OWORD *)&v20.a, *(_OWORD *)&v20.c, *(_OWORD *)&v20.tx);
  }
  return 0;
}

- (unint64_t)pinPositionFromLiveTransformKind:(unint64_t)a3
{
  if (a3 - 2 > 4) {
    return 0;
  }
  else {
    return qword_243928[a3 - 2];
  }
}

- (BOOL)collectImpressionsForChild:(id)a3
{
  return 1;
}

- (BOOL)collectImpressionsForChildren
{
  return 1;
}

- (BOOL)collectLinkEntitiesForChild:(id)a3
{
  return 1;
}

- (BOOL)collectLinkEntitiesForChildren
{
  return 1;
}

- (id)collectLinkEntities
{
  return 0;
}

- (void)appendHoverRegions:(id)a3 relativeToLayout:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v8 = [(TUILayout *)self childrenForHoverRegions];
  id v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v13;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) appendHoverRegions:v6 relativeToLayout:v7];
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)invalidateRenderModel
{
  cachedTransformModel = self->_cachedTransformModel;
  if (cachedTransformModel)
  {
    self->_cachedTransformModel = 0;
  }
  p_parent = &self->_parent;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  if (WeakRetained
    && (id v5 = objc_loadWeakRetained((id *)&self->_parent),
        unsigned int v6 = [v5 shouldAutoInvalidateRenderModelOnChildInvalidate],
        v5,
        WeakRetained,
        v6))
  {
    id v11 = objc_loadWeakRetained((id *)&self->_parent);
    [v11 onChildRenderModelInvalidate:self];
  }
  else
  {
    id v11 = objc_loadWeakRetained((id *)&self->_controller);
    id v7 = objc_loadWeakRetained((id *)&self->_parent);
    unsigned int v8 = [v7 isLayout];
    if (v8) {
      id v9 = objc_loadWeakRetained((id *)p_parent);
    }
    else {
      id v9 = 0;
    }
    [v11 invalidateCachedRenderModelForLayout:v9];
    if (v8) {
  }
    }
}

- (BOOL)shouldAutoInvalidateRenderModelOnChildInvalidate
{
  return 1;
}

- (BOOL)isHorizontallyAligningChildren
{
  return 0;
}

- (BOOL)isVerticallyAligningChildren
{
  return 0;
}

- (BOOL)isDescendentOfLayout:(id)a3
{
  id v4 = a3;
  id v5 = [(TUILayout *)self parent];
  if (v5 == v4)
  {
    unsigned __int8 v7 = 1;
  }
  else
  {
    unsigned int v6 = [(TUILayout *)self parent];
    unsigned __int8 v7 = [v6 isDescendentOfLayout:v4];
  }
  return v7;
}

- (void)setLayoutIsInvalid:(BOOL)a3
{
  self->_$2E822BB417F7D1609F669B00B90D7CC3 flags = ($2E822BB417F7D1609F669B00B90D7CC3)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3);
}

- (BOOL)layoutIsInvalid
{
  return *(_DWORD *)&self->_flags & 1;
}

- (void)setInvalidChildren:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_$2E822BB417F7D1609F669B00B90D7CC3 flags = ($2E822BB417F7D1609F669B00B90D7CC3)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)invalidChildren
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (void)invalidateLayout
{
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    [WeakRetained invalidateLayout:self];
  }
}

- (void)validateLayout
{
  if (*(unsigned char *)&self->_flags)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    [WeakRetained validateLayout:self];
  }
}

- (void)_validateLayout
{
  $2E822BB417F7D1609F669B00B90D7CC3 flags = self->_flags;
  self->_$2E822BB417F7D1609F669B00B90D7CC3 flags = ($2E822BB417F7D1609F669B00B90D7CC3)(*(_DWORD *)&flags | 4);
  [(TUILayout *)self computeLayout];
  [(TUILayout *)self _computeAspectConstrainedSpecifiedWidthHeight];
  self->_$2E822BB417F7D1609F669B00B90D7CC3 flags = ($2E822BB417F7D1609F669B00B90D7CC3)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | (4
                                                                                            * ((*(unsigned int *)&flags >> 2) & 1)));

  TUI::Util::PartialStruct::Storage::compress((TUI::Util::PartialStruct::Storage::Header **)&self->_storage);
}

- (void)_validateLayoutWithBlock:(id)a3
{
  id v4 = (void (**)(void))a3;
  $2E822BB417F7D1609F669B00B90D7CC3 flags = self->_flags;
  self->_$2E822BB417F7D1609F669B00B90D7CC3 flags = ($2E822BB417F7D1609F669B00B90D7CC3)(*(_DWORD *)&flags | 4);
  unsigned int v6 = v4;
  v4[2]();
  [(TUILayout *)self _computeAspectConstrainedSpecifiedWidthHeight];
  self->_$2E822BB417F7D1609F669B00B90D7CC3 flags = ($2E822BB417F7D1609F669B00B90D7CC3)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | (4
                                                                                            * ((*(unsigned int *)&flags >> 2) & 1)));
  TUI::Util::PartialStruct::Storage::compress((TUI::Util::PartialStruct::Storage::Header **)&self->_storage);
}

- (BOOL)isValidating
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (void)setComputedNaturalSize:(CGSize)a3
{
  if (fabs(a3.width) == INFINITY) {
    a3.CGFloat width = 0.0;
  }
  if (fabs(a3.height) == INFINITY) {
    a3.CGFloat height = 0.0;
  }
  if (self->_computedNaturalSize.width != a3.width || self->_computedNaturalSize.height != a3.height)
  {
    self->_CGSize computedNaturalSize = a3;
    id v5 = [(TUILayout *)self parent];
    [v5 onChildTransformedSizeDidChange:self];
  }
}

- (void)setComputedOrigin:(CGPoint)a3
{
  if (self->_computedOrigin.x != a3.x || self->_computedOrigin.y != a3.y)
  {
    self->_computedOrigin = a3;
    [(TUILayout *)self onComputedOriginDidChange];
  }
}

- (void)onComputedOriginDidChange
{
  if (self->_cachedTransformModel)
  {
    *(_DWORD *)&self->_flags |= 0x40u;
    id v3 = [(TUILayout *)self parent];
    [v3 onChildRenderModelInvalidate:self];
  }
}

- (void)onInvalidate
{
  id v4 = [(TUILayout *)self layoutAncestor];
  if (v4 && (v4[16] & 4) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
    [WeakRetained onChildInvalidate:self];
  }
  [(TUILayout *)self invalidateRenderModel];
}

- (void)invalidateIntrinsicSize
{
  *(_DWORD *)&self->_flags |= 0x30u;
  [(TUILayout *)self onInvalidateIntrinsicSize];
}

- (void)onInvalidateIntrinsicSize
{
  [(TUILayout *)self invalidateLayout];
  id v3 = [(TUILayout *)self parent];
  [v3 onChildInvalidateIntrinsicSize:self];
}

- (void)onContainersUpdated
{
  [(TUILayout *)self _updateChildren];

  [(TUILayout *)self onChildrenUpdated];
}

- (BOOL)validatesAllChildren
{
  return 1;
}

- (BOOL)desdendantSpecifiedWidthModified
{
  return *((unsigned char *)&self->_flags + 2) & 1;
}

- (void)updateDesdendantSpecifiedWidthModifiedWithFlag:(BOOL)a3
{
  if (a3)
  {
LABEL_12:
    $2E822BB417F7D1609F669B00B90D7CC3 flags = self->_flags;
    if ((*(_DWORD *)&flags & 0x10000) != 0) {
      return;
    }
    int v9 = 0x10000;
    goto LABEL_14;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = self->_children;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        if ((*(_DWORD *)(*(void *)(*((void *)&v10 + 1) + 8 * i) + 16) & 0x10400) != 0)
        {

          goto LABEL_12;
        }
      }
      id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  $2E822BB417F7D1609F669B00B90D7CC3 flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x10000) != 0)
  {
    int v9 = 0;
LABEL_14:
    self->_$2E822BB417F7D1609F669B00B90D7CC3 flags = ($2E822BB417F7D1609F669B00B90D7CC3)(*(_DWORD *)&flags & 0xFFFEFFFF | v9);
    [(TUILayout *)self onDesdendantSpecifiedWidthModifiedDidChange];
  }
}

- (void)appendLayoutsWithSpecifiedWidthModifiedToArray:(id)a3
{
  id v4 = a3;
  if ((*((unsigned char *)&self->_flags + 1) & 4) != 0) {
    [v4 addObject:self];
  }
}

- (void)appendVisibleBoundsObservers:(id)a3 axis:(unint64_t)a4 offset:(double)a5
{
  id v8 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  int v9 = [(TUILayout *)self layout];
  long long v10 = [v9 children];

  id v11 = [v10 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v15;
    do
    {
      long long v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * (void)v13) appendVisibleBoundsObservers:v8 axis:a4 offset:a5];
        long long v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v10 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)teardown
{
  cachedTransformModel = self->_cachedTransformModel;
  self->_cachedTransformModel = 0;
}

- (BOOL)shouldAppendChildAnchorsForAncestor
{
  return 1;
}

- (void)appendAnchorsToSet:(id)a3 inRoot:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (int *)[(TUIModelLayoutable *)self->_model anchorPosition];
  if (!v8) {
    goto LABEL_29;
  }
  double width = self->_computedNaturalSize.width;
  double height = self->_computedNaturalSize.height;
  id v11 = (char *)[v6 axis];
  if (v11 == (unsigned char *)&def_141F14 + 1)
  {
    if (v8 == (int *)((char *)&def_141F14 + 1))
    {
      double v17 = height * 0.5;
      if ((char *)[(TUILayout *)self computedLayoutDirection] == (char *)&def_141F14 + 1) {
        double width = 0.0;
      }
      goto LABEL_24;
    }
    if (v8 == (int *)((char *)&def_141F14 + 2))
    {
      double v17 = height * 0.5;
      if ((char *)[(TUILayout *)self computedLayoutDirection] != (char *)&def_141F14 + 1) {
        double width = 0.0;
      }
      goto LABEL_24;
    }
    double v12 = NAN;
    BOOL v13 = v8 == (int *)((char *)&def_141F14 + 3);
    double v14 = height * 0.5;
    if (v8 == (int *)((char *)&def_141F14 + 3)) {
      double width = width * 0.5;
    }
    else {
      double width = NAN;
    }
  }
  else
  {
    double v12 = NAN;
    double v14 = height * 0.5;
    if (v8 == (int *)((char *)&dword_4 + 1)) {
      double v15 = width * 0.5;
    }
    else {
      double v15 = NAN;
    }
    if (v8 == (int *)((char *)&dword_4 + 1)) {
      double v12 = 0.0;
    }
    if (v8 == &dword_4) {
      double v16 = width * 0.5;
    }
    else {
      double v16 = v15;
    }
    if (v8 == &dword_4) {
      double v12 = height;
    }
    BOOL v13 = v8 == (int *)((char *)&def_141F14 + 3);
    if (v8 == (int *)((char *)&def_141F14 + 3)) {
      double width = width * 0.5;
    }
    else {
      double width = v16;
    }
  }
  if (v13) {
    double v17 = v14;
  }
  else {
    double v17 = v12;
  }
LABEL_24:
  if (CGFloatIsValid() && CGFloatIsValid())
  {
    [(TUILayout *)self computedTransformInAncestorLayout:v7];
    double v18 = v17 * 0.0 + 0.0 * width + 0.0;
    if (v11 != (unsigned char *)&def_141F14 + 1) {
      double v18 = v17 * 0.0 + 0.0 * width + 0.0;
    }
    [v6 appendScrollAnchor:v18];
  }
LABEL_29:
  if ([(TUILayout *)self shouldAppendChildAnchorsForAncestor]) {
    [(TUILayout *)self appendChildAnchorsToSet:v6 inRoot:v7];
  }
  else {
    [(TUILayout *)self appendEmbeddedAnchorsToSet:v6 inRoot:v7];
  }
}

- (void)appendChildAnchorsToSet:(id)a3 inRoot:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = [(TUILayout *)self children];
  id v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v13;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) appendAnchorsToSet:v6 inRoot:v7];
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (id)guideProviderForLayout:(id)a3
{
  return 0;
}

- (id)guideProvider
{
  id v3 = [(TUILayout *)self layoutAncestor];
  id v4 = [v3 guideProviderForLayout:self];

  return v4;
}

- (BOOL)shouldUseDefaultGuideForLayout:(id)a3 edge:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(TUILayout *)self layoutAncestor];
  LOBYTE(a4) = [v7 shouldUseDefaultGuideForLayout:v6 edge:a4];

  return a4;
}

- (NSString)description
{
  id v3 = objc_alloc((Class)NSMutableString);
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [(TUILayout *)self computedFrame];
  id v6 = NSStringFromCGRect(v19);
  id v7 = [v3 initWithFormat:@"<%@ %p frame=%@", v5, self, v6];

  id v8 = [(TUILayout *)self guideTop];

  if (v8)
  {
    id v9 = [(TUILayout *)self guideTop];
    [v7 appendFormat:@" top=%@", v9];
  }
  uint64_t v10 = [(TUILayout *)self guideBottom];

  if (v10)
  {
    id v11 = [(TUILayout *)self guideBottom];
    [v7 appendFormat:@" bottom=%@", v11];
  }
  long long v12 = [(TUILayout *)self guideLeading];

  if (v12)
  {
    long long v13 = [(TUILayout *)self guideLeading];
    [v7 appendFormat:@" leading=%@", v13];
  }
  long long v14 = [(TUILayout *)self guideTrailing];

  if (v14)
  {
    long long v15 = [(TUILayout *)self guideTrailing];
    [v7 appendFormat:@" trailing=%@", v15];
  }
  [v7 appendString:@">"];
  id v16 = [v7 copy];

  return (NSString *)v16;
}

- (int64_t)computeZIndexWithDefault:(int64_t)a3
{
  id v5 = [(TUILayout *)self box];
  id v6 = [v5 zIndex];

  if (v6 != (id)0x7FFFFFFFFFFFFFFFLL) {
    return (int64_t)v6;
  }
  id v7 = [(TUILayout *)self box];
  id v8 = (char *)[v7 role];

  if (v8 == (unsigned char *)&def_141F14 + 1)
  {
    id v9 = &TUIZIndexBackground;
LABEL_6:
    id v6 = (id)*v9;
    if (*v9 != 0x7FFFFFFFFFFFFFFFLL) {
      return (int64_t)v6;
    }
    goto LABEL_7;
  }
  if (v8 == (unsigned char *)&def_141F14 + 3)
  {
    id v9 = &TUIZIndexForeground;
    goto LABEL_6;
  }
LABEL_7:
  uint64_t v10 = [(TUILayout *)self layoutAncestor];
  id v11 = v10;
  if (v10) {
    a3 = (int64_t)[v10 computeZIndexWithDefault:a3];
  }

  return a3;
}

- (BOOL)shouldDescendentsInheritRefSpecWithContext:(id)a3
{
  return ![(TUILayout *)self shouldUseSubviewRenderModelWithContext:a3];
}

- (id)inheritedRefIdWithContext:(id)a3
{
  id v4 = a3;
  if ([(TUILayout *)self shouldDescendentsInheritRefSpecWithContext:v4])
  {
    id v5 = [(TUILayout *)self computedRefIdWithContext:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)inheritedRefInstanceWithContext:(id)a3
{
  id v4 = a3;
  if ([(TUILayout *)self shouldDescendentsInheritRefSpecWithContext:v4])
  {
    id v5 = [(TUILayout *)self computedRefInstanceWithContext:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)computedRefIdWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [(TUILayout *)self box];
  id v6 = [v5 refId];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v9 = [(TUILayout *)self layoutAncestor];
    id v8 = [v9 inheritedRefIdWithContext:v4];
  }

  return v8;
}

- (id)computedRefInstanceWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [(TUILayout *)self box];
  id v6 = [v5 refInstance];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v9 = [(TUILayout *)self layoutAncestor];
    id v8 = [v9 inheritedRefInstanceWithContext:v4];
  }

  return v8;
}

- (void)appendEmbeddedIdentifierMaps:(id)a3 updateControllers:(id)a4 UUIDs:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = [(TUILayout *)self children];
  id v12 = [v11 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v16;
    do
    {
      long long v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * (void)v14) appendEmbeddedIdentifierMaps:v8 updateControllers:v9 UUIDs:v10];
        long long v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v11 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (CGSize)renderModelSizeWithContext:(id)a3
{
  id v4 = a3;
  [(TUILayout *)self computedNaturalSize];
  double v6 = v5;
  double v8 = v7;
  [v4 contentsScale];
  double v10 = TUISizeRoundedForScale(v6, v8, v9);
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (BOOL)shouldUpdateContainingMetricsForScrollableContent
{
  return 1;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)modifiedSpecifiedWidthForChild:(SEL)a3
{
  return ($881BB7C90C7D0DFCC1492E3DC022A30F *)0x7FC000007FC00000;
}

- (id)hoverIdentifierWithName:(id)a3
{
  id v4 = a3;
  double v5 = self;
  double v6 = v5;
  if (v5)
  {
    double v7 = v5;
    do
    {
      if (objc_opt_respondsToSelector()) {
        break;
      }
      uint64_t v8 = [v7 layoutAncestor];

      double v7 = (void *)v8;
    }
    while (v8);
  }
  else
  {
    double v7 = 0;
  }
  double v9 = [v7 hoverIdentifierWithName:v4 forDescdendent:v6];

  return v9;
}

- (UIEdgeInsets)erasableInsetsForContentsScale:(double)a3
{
  [(TUILayout *)self computedBounds];
  CGFloat v5 = v4;
  CGFloat v30 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [(TUILayout *)self computedErasableBounds];
  CGFloat y = v36.origin.y;
  CGFloat width = v36.size.width;
  CGFloat height = v36.size.height;
  CGFloat x = v36.origin.x;
  CGFloat v31 = v36.origin.x;
  double MinY = CGRectGetMinY(v36);
  v37.origin.CGFloat x = v5;
  v37.origin.CGFloat y = v7;
  v37.size.CGFloat width = v9;
  v37.size.CGFloat height = v11;
  double v33 = MinY - CGRectGetMinY(v37);
  v38.origin.CGFloat x = x;
  v38.origin.CGFloat y = y;
  v38.size.CGFloat width = width;
  v38.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v38);
  v39.origin.CGFloat x = v5;
  v39.origin.CGFloat y = v7;
  v39.size.CGFloat width = v9;
  v39.size.CGFloat height = v11;
  double v32 = MinX - CGRectGetMinX(v39);
  v40.origin.CGFloat x = v5;
  v40.origin.CGFloat y = v7;
  v40.size.CGFloat width = v9;
  v40.size.CGFloat height = v11;
  double MaxY = CGRectGetMaxY(v40);
  v41.origin.CGFloat x = v31;
  v41.origin.CGFloat y = y;
  v41.size.CGFloat width = width;
  v41.size.CGFloat height = height;
  double v18 = MaxY - CGRectGetMaxY(v41);
  v42.origin.CGFloat y = v7;
  v42.origin.CGFloat x = v30;
  v42.size.CGFloat width = v9;
  v42.size.CGFloat height = v11;
  double MaxX = CGRectGetMaxX(v42);
  v43.origin.CGFloat x = v31;
  v43.origin.CGFloat y = y;
  v43.size.CGFloat width = width;
  v43.size.CGFloat height = height;
  double v20 = MaxX - CGRectGetMaxX(v43);
  double v23 = v32;
  *(double *)v22.i64 = v33;
  if (v33 > 0.0) {
    *(double *)v22.i64 = 0.0;
  }
  if (v32 > 0.0) {
    double v23 = 0.0;
  }
  if (v18 <= 0.0) {
    double v24 = v18;
  }
  else {
    double v24 = 0.0;
  }
  if (v20 > 0.0) {
    double v20 = 0.0;
  }

  double v25 = TUIInsetsExtendedForScale(v22, v23, v24, v20, a3, v21);
  result.double right = v28;
  result.double bottom = v27;
  result.double left = v26;
  result.top = v25;
  return result;
}

- (id)debugContentDescription
{
  return 0;
}

- (BOOL)collectHostingPropertiesWithCollector:(id)a3
{
  return 1;
}

- (id)modelIdentifierForEnclosingScrollable
{
  double v2 = self;
  do
  {
    id v3 = [(TUILayout *)v2 layoutAncestor];

    double v4 = [(TUILayout *)v3 modelIdentifierForScrollable];
    if (v4) {
      break;
    }
    double v2 = v3;
  }
  while (v3);

  return v4;
}

- (id)modelIdentifierForScrollable
{
  return 0;
}

- (NSArray)containers
{
  return self->_containers;
}

- (void)setContainers:(id)a3
{
}

- (TUIModelLayoutable)model
{
  return self->_model;
}

- (TUILayoutController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);

  return (TUILayoutController *)WeakRetained;
}

- (TUILayoutContaining)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);

  return (TUILayoutContaining *)WeakRetained;
}

- (NSArray)children
{
  return self->_children;
}

- (CGPoint)computedOrigin
{
  double x = self->_computedOrigin.x;
  double y = self->_computedOrigin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGSize)computedNaturalSize
{
  double width = self->_computedNaturalSize.width;
  double height = self->_computedNaturalSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_containers, 0);
  objc_storeStrong((id *)&self->_cachedTransformModel, 0);

  TUI::Util::PartialStruct::Storage::~Storage((TUI::Util::PartialStruct::Storage::Header **)&self->_storage);
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end