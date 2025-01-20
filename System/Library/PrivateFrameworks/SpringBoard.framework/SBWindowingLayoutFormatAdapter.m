@interface SBWindowingLayoutFormatAdapter
- (CGRect)_calculateProposedFrameForSizeClass:(int64_t)a3 positionClass:(int64_t)a4 index:(unint64_t)a5;
- (NSArray)layoutRequests;
- (NSDictionary)layoutRoleToLayoutAttributes;
- (SBWindowingLayoutFormatAdapter)initWithWindowScene:(id)a3;
- (void)_createLayoutRoleToLayoutAttributesMap;
- (void)parse:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5;
@end

@implementation SBWindowingLayoutFormatAdapter

- (SBWindowingLayoutFormatAdapter)initWithWindowScene:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SBWindowingLayoutFormatAdapter;
  v5 = [(SBWindowingLayoutFormatAdapter *)&v20 init];
  if (v5)
  {
    v6 = [v4 switcherController];
    v7 = [v6 contentViewController];
    uint64_t v8 = objc_opt_class();
    id v9 = v7;
    if (v8)
    {
      if (objc_opt_isKindOfClass()) {
        v10 = v9;
      }
      else {
        v10 = 0;
      }
    }
    else
    {
      v10 = 0;
    }
    id v11 = v10;

    v12 = [v11 view];
    [v12 bounds];
    v5->_containerViewBounds.origin.x = v13;
    v5->_containerViewBounds.origin.y = v14;
    v5->_containerViewBounds.size.width = v15;
    v5->_containerViewBounds.size.height = v16;

    uint64_t v17 = [v11 chamoisLayoutAttributes];

    chamoisLayoutAttributes = v5->_chamoisLayoutAttributes;
    v5->_chamoisLayoutAttributes = (SBSwitcherChamoisLayoutAttributes *)v17;
  }
  return v5;
}

- (CGRect)_calculateProposedFrameForSizeClass:(int64_t)a3 positionClass:(int64_t)a4 index:(unint64_t)a5
{
  double width = self->_containerViewBounds.size.width;
  double height = self->_containerViewBounds.size.height;
  id v11 = self->_chamoisLayoutAttributes;
  v12 = v11;
  double v13 = 0.0;
  double v14 = 0.0;
  double v15 = 0.0;
  if (self->_numberOfItems != 1)
  {
    [(SBSwitcherChamoisLayoutAttributes *)v11 stageInterItemSpacing];
    double v14 = v16;
    if (self->_numberOfItems != 1)
    {
      [(SBSwitcherChamoisLayoutAttributes *)v12 screenEdgePadding];
      double v15 = v17;
    }
  }
  double v18 = 0.0;
  switch(a3)
  {
    case 0:
      double v18 = (width + v15 * -2.0 - v14 * (double)(self->_numberOfItems - 1)) / (double)self->_numberOfItems;
      goto LABEL_10;
    case 1:
    case 2:
      double v13 = height;
      double v18 = width;
      break;
    case 3:
      [(SBSwitcherChamoisLayoutAttributes *)v12 minimumWindowWidth];
      double v18 = v19;
      [(SBSwitcherChamoisLayoutAttributes *)v12 minimumWindowWidth];
      double v13 = v20;
      break;
    case 5:
      double v18 = (width - v15 * 2.0) * 0.5 - v14;
      double v13 = (height - v15 * 2.0) * 0.5 - v14;
      break;
    case 6:
      double v18 = (width + v15 * -2.0) * 0.5;
LABEL_10:
      double v13 = height;
      break;
    default:
      break;
  }
  double v21 = 0.0;
  switch(a4)
  {
    case 0:
      if (a5) {
        double v15 = v14 + v18 + self->_xPositionOffset;
      }
      self->_xPositionOffset = v15;
      UIRectGetCenter();
      +[SBDisplayItemLayoutAttributes normalizedPointForPoint:inBounds:](SBDisplayItemLayoutAttributes, "normalizedPointForPoint:inBounds:");
      double v21 = v22;
      double v24 = v23;
      break;
    case 1:
      double v24 = 0.5;
      double v21 = 0.5;
      break;
    case 2:
      double v21 = 1.0;
      goto LABEL_17;
    case 3:
      double v24 = 0.01;
      double v21 = 0.01;
      break;
    case 4:
      double v24 = 1.0;
      break;
    case 5:
      double v24 = 1.0;
      double v21 = 1.0;
      break;
    default:
LABEL_17:
      double v24 = 0.0;
      break;
  }

  double v25 = v21;
  double v26 = v24;
  double v27 = v18;
  double v28 = v13;
  result.size.double height = v28;
  result.size.double width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (void)_createLayoutRoleToLayoutAttributesMap
{
  CGSize size = self->_containerViewBounds.size;
  CGPoint origin = self->_containerViewBounds.origin;
  CGSize v19 = size;
  id v4 = self->_chamoisLayoutAttributes;
  uint64_t v12 = 0;
  double v13 = &v12;
  uint64_t v14 = 0x3032000000;
  double v15 = __Block_byref_object_copy__90;
  double v16 = __Block_byref_object_dispose__90;
  id v17 = (id)objc_opt_new();
  v5 = [(NSArray *)self->_layoutRequests bs_flatten];
  self->_numberOfItems = [v5 count];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__SBWindowingLayoutFormatAdapter__createLayoutRoleToLayoutAttributesMap__block_invoke;
  v7[3] = &unk_1E6B09D48;
  v7[4] = self;
  v6 = v4;
  CGPoint v10 = origin;
  CGSize v11 = v19;
  uint64_t v8 = v6;
  id v9 = &v12;
  [v5 enumerateObjectsUsingBlock:v7];
  if ([(id)v13[5] count]) {
    objc_storeStrong((id *)&self->_layoutRoleToLayoutAttributes, (id)v13[5]);
  }

  _Block_object_dispose(&v12, 8);
}

void __72__SBWindowingLayoutFormatAdapter__createLayoutRoleToLayoutAttributesMap__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = objc_alloc_init(SBDisplayItemLayoutAttributes);
  objc_msgSend(*(id *)(a1 + 32), "_calculateProposedFrameForSizeClass:positionClass:index:", objc_msgSend(v5, "size"), objc_msgSend(v5, "position"), a3);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  uint64_t v15 = [v5 size];
  if ((unint64_t)(v15 - 1) >= 2)
  {
    if (v15 == 4)
    {
      id v17 = [(SBDisplayItemLayoutAttributes *)v6 attributesByModifyingSizingPolicy:0];

      [*(id *)(a1 + 40) defaultWindowSize];
      double v20 = v19;
      double v22 = v21;
      [*(id *)(a1 + 40) defaultWindowSize];
      [*(id *)(a1 + 40) screenEdgePadding];
      uint64_t v35 = v23;
      SBDisplayItemAttributedSizeInfer((uint64_t)v37, v20, v22, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
      double v24 = v37;
    }
    else
    {
      id v17 = [(SBDisplayItemLayoutAttributes *)v6 attributesByModifyingSizingPolicy:0];

      [*(id *)(a1 + 40) defaultWindowSize];
      [*(id *)(a1 + 40) screenEdgePadding];
      uint64_t v35 = v25;
      SBDisplayItemAttributedSizeInfer((uint64_t)v36, v12, v14, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
      double v24 = v36;
    }
    uint64_t v18 = objc_msgSend(v17, "attributesByModifyingAttributedSize:", v24, v35);
  }
  else
  {
    double v16 = [(SBDisplayItemLayoutAttributes *)v6 attributesByModifyingSizingPolicy:2];

    id v17 = objc_msgSend(v16, "attributesByModifyingAttributedSize:", v39, SBDisplayItemAttributedSizeUnspecified((uint64_t)v39).n128_f64[0]);

    uint64_t v18 = objc_msgSend(v17, "attributesByModifyingAttributedUserSizeBeforeOverlapping:", v38, SBDisplayItemAttributedSizeUnspecified((uint64_t)v38).n128_f64[0]);
  }
  double v26 = (void *)v18;

  double v27 = objc_msgSend(v26, "attributesByModifyingNormalizedCenter:", v8, v10);

  int v28 = [v5 wantsFocus];
  uint64_t v29 = 56;
  if (v28) {
    uint64_t v29 = 48;
  }
  *(void *)(*(void *)(a1 + 32) + 56) = *(void *)(*(void *)(a1 + 32) + v29);
  v30 = [v27 attributesByModifyingLastInteractionTime:*(void *)(*(void *)(a1 + 32) + 56)];

  if ([v5 wantsFocus]) {
    uint64_t v31 = 1;
  }
  else {
    uint64_t v31 = 2;
  }
  v32 = [v30 attributesByModifyingOcclusionState:v31];

  --*(void *)(*(void *)(a1 + 32) + 56);
  v33 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  v34 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "layoutRole"));
  [v33 setObject:v32 forKey:v34];
}

- (void)parse:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5
{
  id v10 = 0;
  double v7 = +[SBWindowingLayoutFormatParser parse:a3 bundleIdentifiersToLaunch:a4 error:&v10];
  id v8 = v10;
  layoutRequests = self->_layoutRequests;
  self->_layoutRequests = v7;

  if (v8) {
    *a5 = v8;
  }
  else {
    [(SBWindowingLayoutFormatAdapter *)self _createLayoutRoleToLayoutAttributesMap];
  }
}

- (NSArray)layoutRequests
{
  return self->_layoutRequests;
}

- (NSDictionary)layoutRoleToLayoutAttributes
{
  return self->_layoutRoleToLayoutAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutRoleToLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_layoutRequests, 0);
  objc_storeStrong((id *)&self->_chamoisLayoutAttributes, 0);
}

@end