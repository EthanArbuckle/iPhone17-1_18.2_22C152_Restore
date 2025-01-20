@interface UITableCellAccessoryLayout
- (CGRect)_frameForAccessoryAtIndex:(unint64_t)a3 inAccessories:(id)a4 containerSize:(CGSize)a5 withXOrigin:(double *)a6;
- (CGRect)endLayout;
- (CGRect)finalFrameForAccessory:(id)a3;
- (CGRect)initialFrameForAccessory:(id)a3;
- (CGRect)totalFrame;
- (NSDictionary)finalFrames;
- (NSDictionary)initialFrames;
- (NSMutableDictionary)finalAlphas;
- (NSMutableDictionary)initialAlphas;
- (UICellAccessoryManager)manager;
- (UITableCellAccessoryLayout)init;
- (double)_disclosureLayoutWidth;
- (double)_layoutWidthForAccessory:(id)a3 withItemWidth:(double)a4;
- (double)_standardLayoutWidth;
- (double)_totalWidthForAccessories:(id)a3 withContainerSize:(CGSize)a4;
- (double)finalAlphaForAccessory:(id)a3;
- (double)initialAlphaForAccessory:(id)a3;
- (double)safeAreaInset;
- (id)_framesForAccessories:(id)a3 withContainerSize:(CGSize)a4 outTotalFrame:(CGRect *)a5;
- (id)disclosureLayoutWidthProvider;
- (id)spacingBlock;
- (id)standardLayoutWidthProvider;
- (unint64_t)edge;
- (void)prepareLayoutForAccessories:(id)a3 previousAccessories:(id)a4 configurationIdentifier:(id)a5 animated:(BOOL)a6;
- (void)setDisclosureLayoutWidthProvider:(id)a3;
- (void)setEdge:(unint64_t)a3;
- (void)setFinalAlphas:(id)a3;
- (void)setFinalFrames:(id)a3;
- (void)setInitialAlphas:(id)a3;
- (void)setInitialFrames:(id)a3;
- (void)setManager:(id)a3;
- (void)setSafeAreaInset:(double)a3;
- (void)setSpacingBlock:(id)a3;
- (void)setStandardLayoutWidthProvider:(id)a3;
- (void)setTotalFrame:(CGRect)a3;
@end

@implementation UITableCellAccessoryLayout

uint64_t __96__UITableCellAccessoryLayout__frameForAccessoryAtIndex_inAccessories_containerSize_withXOrigin___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) bounds];
  objc_msgSend(*(id *)(a1 + 32), "setBounds:");
  v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

void __111__UITableCellAccessoryLayout_prepareLayoutForAccessories_previousAccessories_configurationIdentifier_animated___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v24 = [v5 identifier];
  v6 = [v5 view];
  objc_msgSend(v5, "sizeThatFits:", *(double *)(a1 + 96), *(double *)(a1 + 104));

  int v7 = *(unsigned __int8 *)(a1 + 120);
  if ([*(id *)(a1 + 32) containsObject:v24])
  {
    if (v7 && ((*(uint64_t (**)(void))(*(void *)(a1 + 112) + 16))() & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 48), "_frameForAccessoryAtIndex:inAccessories:containerSize:withXOrigin:", a3, *(void *)(a1 + 40), *(void *)(*(void *)(a1 + 80) + 8) + 24, *(double *)(a1 + 96), *(double *)(a1 + 104));
      double v12 = v20;
      double v14 = v21;
      double v16 = v22;
    }
    else
    {
      v8 = [*(id *)(a1 + 64) objectForKeyedSubscript:v24];
      [v8 CGRectValue];
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;

      double v17 = v10 - *(double *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
    }
    v23 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v17, v12, v14, v16);
    [*(id *)(a1 + 56) setObject:v23 forKeyedSubscript:v24];

    if ([*(id *)(a1 + 72) containsObject:v6]) {
      v19 = &unk_1ED3F26A8;
    }
    else {
      v19 = &unk_1ED3F2698;
    }
  }
  else
  {
    v18 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
    [*(id *)(a1 + 56) setObject:v18 forKeyedSubscript:v24];

    v19 = &unk_1ED3F26A8;
  }
  [*(id *)(*(void *)(a1 + 48) + 72) setObject:v19 forKeyedSubscript:v24];
  [*(id *)(*(void *)(a1 + 48) + 80) setObject:&unk_1ED3F26A8 forKeyedSubscript:v24];
}

void __74__UITableCellAccessoryLayout__totalWidthForAccessories_withContainerSize___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  objc_msgSend(v10, "sizeThatFits:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "_layoutWidthForAccessory:withItemWidth:", v10);
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v5
                                                              + *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                          + 24);
  if (a3)
  {
    v6 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a3 - 1];
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 48);
    v8 = [v6 identifier];
    double v9 = [v10 identifier];
    *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (*(double (**)(uint64_t, void *, void *))(v7 + 16))(v7, v8, v9)+ *(double *)(*(void *)(*(void *)(a1 + 48) + 8)+ 24);
  }
}

- (CGRect)_frameForAccessoryAtIndex:(unint64_t)a3 inAccessories:(id)a4 containerSize:(CGSize)a5 withXOrigin:(double *)a6
{
  double height = a5.height;
  double width = a5.width;
  id v11 = a4;
  double v12 = [v11 objectAtIndexedSubscript:a3];
  objc_msgSend(v12, "sizeThatFits:", width, height);
  double v14 = v13;
  double v16 = v15;
  double v17 = [v12 view];
  char v44 = 0;
  v18 = _AccessoryFontForLineHeightAlignment(v17, &v44);
  if (v18)
  {
    uint64_t v37 = MEMORY[0x1E4F143A8];
    uint64_t v38 = 3221225472;
    v39 = __96__UITableCellAccessoryLayout__frameForAccessoryAtIndex_inAccessories_containerSize_withXOrigin___block_invoke;
    v40 = &unk_1E52DD178;
    id v19 = v17;
    id v41 = v19;
    double v42 = v14;
    double v43 = v16;
    +[UIView performWithoutAnimation:&v37];
    _UITableCellLineHeightCenteredViewInRect(v19, v18, 0.0, 0.0, width, height);
    double v21 = v20;
  }
  else
  {
    UIRoundToViewScale(v17);
    double v21 = v22;
  }
  -[UITableCellAccessoryLayout _layoutWidthForAccessory:withItemWidth:](self, "_layoutWidthForAccessory:withItemWidth:", v12, v14, v37, v38, v39, v40);
  double v24 = v23;
  double v25 = 0.0;
  if ([v11 count] - 1 > a3)
  {
    v26 = [v11 objectAtIndexedSubscript:a3 + 1];
    spacingBlock = (double (**)(id, void *, void *))self->_spacingBlock;
    v28 = [v12 identifier];
    v29 = [v26 identifier];
    double v25 = spacingBlock[2](spacingBlock, v28, v29);
  }
  double v30 = *a6;
  double v31 = v24 + v25 + *a6;
  if (self->_edge != 8)
  {
    double v31 = *a6 - (v24 + v25);
    double v30 = *a6 - v24;
  }
  double v32 = (v24 - v14) * 0.5 + v30;
  *a6 = v31;

  double v33 = v32;
  double v34 = v21;
  double v35 = v14;
  double v36 = v16;
  result.size.double height = v36;
  result.size.double width = v35;
  result.origin.y = v34;
  result.origin.x = v33;
  return result;
}

- (CGRect)initialFrameForAccessory:(id)a3
{
  initialFrames = self->_initialFrames;
  v4 = [a3 identifier];
  double v5 = [(NSDictionary *)initialFrames objectForKeyedSubscript:v4];
  [v5 CGRectValue];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (double)initialAlphaForAccessory:(id)a3
{
  initialAlphas = self->_initialAlphas;
  v4 = [a3 identifier];
  double v5 = [(NSMutableDictionary *)initialAlphas objectForKeyedSubscript:v4];
  [v5 doubleValue];
  double v7 = v6;

  return v7;
}

- (void)setSpacingBlock:(id)a3
{
  if (self->_spacingBlock != a3)
  {
    v4 = _Block_copy(a3);
    id spacingBlock = self->_spacingBlock;
    self->_id spacingBlock = v4;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
    [WeakRetained setNeedsLayout];
  }
}

- (void)setStandardLayoutWidthProvider:(id)a3
{
}

- (void)setSafeAreaInset:(double)a3
{
  self->_safeAreaInset = a3;
}

- (void)setEdge:(unint64_t)a3
{
  self->_edge = a3;
}

- (void)setDisclosureLayoutWidthProvider:(id)a3
{
}

- (void)prepareLayoutForAccessories:(id)a3 previousAccessories:(id)a4 configurationIdentifier:(id)a5 animated:(BOOL)a6
{
  uint64_t v126 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v67 = a5;
  v74 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v73 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v8, "count"));
  long long v119 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v119 objects:v125 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v120;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v120 != v12) {
          objc_enumerationMutation(v10);
        }
        double v14 = *(void **)(*((void *)&v119 + 1) + 8 * i);
        double v15 = [v14 identifier];
        [v74 addObject:v15];

        double v16 = [v14 view];
        [v73 addObject:v16];
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v119 objects:v125 count:16];
    }
    while (v11);
  }

  double v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v9, "count"));
  v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v9, "count"));
  long long v117 = 0u;
  long long v118 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  obuint64_t j = v9;
  uint64_t v19 = [obj countByEnumeratingWithState:&v115 objects:v124 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v116;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v116 != v20) {
          objc_enumerationMutation(obj);
        }
        double v22 = *(void **)(*((void *)&v115 + 1) + 8 * j);
        double v23 = [v22 identifier];
        [v17 addObject:v23];

        double v24 = [v22 view];
        [v18 addObject:v24];
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v115 objects:v124 count:16];
    }
    while (v19);
  }

  double v25 = (void *)[v74 mutableCopy];
  [v25 intersectSet:v17];
  [v74 minusSet:v25];
  [v17 minusSet:v25];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  [WeakRetained containerSize];
  double v28 = v27;
  double v30 = v29;

  uint64_t v111 = 0;
  v112 = (double *)&v111;
  uint64_t v113 = 0x2020000000;
  uint64_t v114 = 0x7FF0000000000000;
  v70 = -[UITableCellAccessoryLayout _framesForAccessories:withContainerSize:outTotalFrame:](self, "_framesForAccessories:withContainerSize:outTotalFrame:", obj, 0, v28, v30);
  v66 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v10, "count"));
  double v31 = -[UITableCellAccessoryLayout _framesForAccessories:withContainerSize:outTotalFrame:](self, "_framesForAccessories:withContainerSize:outTotalFrame:", v10, &self->_totalFrame, v28, v30);
  v71 = (void *)[v31 mutableCopy];

  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  id v32 = v10;
  uint64_t v33 = [v32 countByEnumeratingWithState:&v107 objects:v123 count:16];
  if (v33)
  {
    uint64_t v34 = *(void *)v108;
    do
    {
      for (uint64_t k = 0; k != v33; ++k)
      {
        if (*(void *)v108 != v34) {
          objc_enumerationMutation(v32);
        }
        double v36 = [*(id *)(*((void *)&v107 + 1) + 8 * k) identifier];
        if ([v25 containsObject:v36])
        {
          uint64_t v37 = [v71 objectForKeyedSubscript:v36];
          [v37 CGRectValue];
          double MinX = CGRectGetMinX(v127);
          v39 = [v70 objectForKeyedSubscript:v36];
          [v39 CGRectValue];
          double v40 = CGRectGetMinX(v128);

          double v41 = MinX - v40;
          double v42 = v112[3];
          if (v42 == INFINITY || (v43 = v42 == v41, double v41 = 0.0, !v43)) {
            v112[3] = v41;
          }
        }
      }
      uint64_t v33 = [v32 countByEnumeratingWithState:&v107 objects:v123 count:16];
    }
    while (v33);
  }

  if (v112[3] == INFINITY) {
    v112[3] = 0.0;
  }
  v106[0] = 0;
  v106[1] = v106;
  double v44 = 0.0;
  if (self->_edge == 8) {
    double v44 = v28;
  }
  v106[2] = 0x2020000000;
  *(double *)&v106[3] = v44;
  v105[0] = 0;
  v105[1] = v105;
  v105[2] = 0x2020000000;
  *(double *)&v105[3] = v44;
  v103[0] = MEMORY[0x1E4F143A8];
  v103[1] = 3221225472;
  v103[2] = __111__UITableCellAccessoryLayout_prepareLayoutForAccessories_previousAccessories_configurationIdentifier_animated___block_invoke;
  v103[3] = &unk_1E53089F0;
  id v104 = v25;
  v45 = (__CFString *)v67;
  v46 = v45;
  id v65 = v104;
  if (v45 == @"editing")
  {
    char v47 = 1;
  }
  else if (v45)
  {
    char v47 = [(__CFString *)v45 isEqual:@"editing"];
  }
  else
  {
    char v47 = 0;
  }

  v90[0] = MEMORY[0x1E4F143A8];
  v90[1] = 3221225472;
  v90[2] = __111__UITableCellAccessoryLayout_prepareLayoutForAccessories_previousAccessories_configurationIdentifier_animated___block_invoke_2;
  v90[3] = &unk_1E5308A18;
  double v99 = v28;
  double v100 = v30;
  char v102 = v47;
  id v68 = v74;
  id v91 = v68;
  v101 = v103;
  id v48 = v32;
  id v92 = v48;
  v93 = self;
  v97 = v106;
  id v49 = v66;
  id v94 = v49;
  id v50 = v71;
  id v95 = v50;
  v98 = &v111;
  id v51 = v18;
  id v96 = v51;
  [v48 enumerateObjectsUsingBlock:v90];
  v52 = v46;
  v53 = v52;
  v75 = v51;
  if (v52 == @"normal")
  {
    char v54 = 1;
  }
  else if (v52)
  {
    char v54 = [(__CFString *)v52 isEqual:@"normal"];
  }
  else
  {
    char v54 = 0;
  }

  v76[0] = MEMORY[0x1E4F143A8];
  v76[1] = 3221225472;
  v76[2] = __111__UITableCellAccessoryLayout_prepareLayoutForAccessories_previousAccessories_configurationIdentifier_animated___block_invoke_12;
  v76[3] = &unk_1E5308A40;
  id v55 = v17;
  char v89 = v54;
  id v77 = v55;
  v86 = v103;
  id v56 = obj;
  id v78 = v56;
  v57 = (NSDictionary *)v49;
  v79 = v57;
  v80 = self;
  double v87 = v28;
  double v88 = v30;
  v84 = v105;
  v58 = (NSDictionary *)v50;
  v81 = v58;
  id v59 = v70;
  id v82 = v59;
  v85 = &v111;
  id v60 = v73;
  id v83 = v60;
  [v56 enumerateObjectsUsingBlock:v76];
  initialFrames = self->_initialFrames;
  self->_initialFrames = v57;
  v62 = v57;

  finalFrames = self->_finalFrames;
  self->_finalFrames = v58;
  v64 = v58;

  _Block_object_dispose(v105, 8);
  _Block_object_dispose(v106, 8);

  _Block_object_dispose(&v111, 8);
}

- (id)_framesForAccessories:(id)a3 withContainerSize:(CGSize)a4 outTotalFrame:(CGRect *)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v9, "count"));
  -[UITableCellAccessoryLayout _totalWidthForAccessories:withContainerSize:](self, "_totalWidthForAccessories:withContainerSize:", v9, width, height);
  if (v11 <= 0.0)
  {
    double safeAreaInset = self->_safeAreaInset;
    if (!a5) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  double v12 = v11;
  id spacingBlock = (double (**)(id, void, void *))self->_spacingBlock;
  double v14 = [v9 firstObject];
  double v15 = [v14 identifier];
  double v16 = spacingBlock[2](spacingBlock, 0, v15);

  double v17 = (double (**)(id, void *, void))self->_spacingBlock;
  v18 = [v9 lastObject];
  uint64_t v19 = [v18 identifier];
  double v20 = v17[2](v17, v19, 0);

  if (v20 < self->_safeAreaInset) {
    double v20 = self->_safeAreaInset;
  }
  v30[0] = 0;
  v30[1] = v30;
  double v21 = v12 + v20;
  if (self->_edge == 8) {
    double v21 = width - (v12 + v20);
  }
  v30[2] = 0x2020000000;
  *(double *)&v30[3] = v21;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __84__UITableCellAccessoryLayout__framesForAccessories_withContainerSize_outTotalFrame___block_invoke;
  v24[3] = &unk_1E53089C8;
  v24[4] = self;
  double v28 = width;
  double v29 = height;
  id v25 = v9;
  double v27 = v30;
  id v26 = v10;
  [v25 enumerateObjectsUsingBlock:v24];
  double safeAreaInset = v12 + v16 + v20;

  _Block_object_dispose(v30, 8);
  if (a5)
  {
LABEL_9:
    a5->origin.x = 0.0;
    a5->origin.y = 0.0;
    a5->size.double width = safeAreaInset;
    a5->size.double height = height;
    if (self->_edge == 8)
    {
      v32.origin.x = 0.0;
      v32.origin.y = 0.0;
      v32.size.double width = safeAreaInset;
      v32.size.double height = height;
      a5->origin.x = width - CGRectGetWidth(v32);
    }
  }
LABEL_11:

  return v10;
}

- (double)_totalWidthForAccessories:(id)a3 withContainerSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v7 = a3;
  if ([v7 count])
  {
    uint64_t v15 = 0;
    double v16 = (double *)&v15;
    uint64_t v17 = 0x2020000000;
    uint64_t v18 = 0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __74__UITableCellAccessoryLayout__totalWidthForAccessories_withContainerSize___block_invoke;
    v10[3] = &unk_1E53089A0;
    CGFloat v13 = width;
    CGFloat v14 = height;
    v10[4] = self;
    double v12 = &v15;
    id v11 = v7;
    [v11 enumerateObjectsUsingBlock:v10];
    double v8 = v16[3];

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    double v8 = 0.0;
  }

  return v8;
}

- (void)setManager:(id)a3
{
}

- (CGRect)endLayout
{
  CGFloat x = self->_totalFrame.origin.x;
  CGFloat y = self->_totalFrame.origin.y;
  CGFloat width = self->_totalFrame.size.width;
  CGFloat height = self->_totalFrame.size.height;
  CGSize v7 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  self->_totalFrame.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  self->_totalFrame.size = v7;
  initialFrames = self->_initialFrames;
  self->_initialFrames = 0;

  finalFrames = self->_finalFrames;
  self->_finalFrames = 0;

  [(NSMutableDictionary *)self->_initialAlphas removeAllObjects];
  [(NSMutableDictionary *)self->_finalAlphas removeAllObjects];
  double v10 = x;
  double v11 = y;
  double v12 = width;
  double v13 = height;
  result.size.CGFloat height = v13;
  result.size.CGFloat width = v12;
  result.origin.CGFloat y = v11;
  result.origin.CGFloat x = v10;
  return result;
}

- (UITableCellAccessoryLayout)init
{
  v9.receiver = self;
  v9.super_class = (Class)UITableCellAccessoryLayout;
  v2 = [(UITableCellAccessoryLayout *)&v9 init];
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  *(_OWORD *)(v2 + 88) = *MEMORY[0x1E4F1DB20];
  *(_OWORD *)(v2 + 104) = v3;
  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  double v5 = (void *)*((void *)v2 + 9);
  *((void *)v2 + 9) = v4;

  uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
  CGSize v7 = (void *)*((void *)v2 + 10);
  *((void *)v2 + 10) = v6;

  return (UITableCellAccessoryLayout *)v2;
}

- (double)_layoutWidthForAccessory:(id)a3 withItemWidth:(double)a4
{
  id v6 = a3;
  [v6 reservedLayoutWidth];
  if (v7 == 1.79769313e308) {
    goto LABEL_8;
  }
  if (v7 == -1.79769313e308) {
    goto LABEL_3;
  }
  if (v7 != -1000.0)
  {
    if (v7 != 0.0)
    {
      a4 = v7;
      goto LABEL_8;
    }
    char v12 = 0;
    double v10 = [v6 view];
    id v11 = _AccessoryFontForLineHeightAlignment(v10, &v12);

    if (!v12) {
      goto LABEL_8;
    }
LABEL_3:
    [(UITableCellAccessoryLayout *)self _standardLayoutWidth];
    goto LABEL_6;
  }
  [(UITableCellAccessoryLayout *)self _disclosureLayoutWidth];
LABEL_6:
  if (v8 > 0.0) {
    a4 = v8;
  }
LABEL_8:

  return a4;
}

- (double)_standardLayoutWidth
{
  standardLayoutWidthProvider = (void (**)(void))self->_standardLayoutWidthProvider;
  if (!standardLayoutWidthProvider) {
    return 0.0;
  }
  standardLayoutWidthProvider[2]();
  return result;
}

- (CGRect)finalFrameForAccessory:(id)a3
{
  finalFrames = self->_finalFrames;
  uint64_t v4 = [a3 identifier];
  double v5 = [(NSDictionary *)finalFrames objectForKeyedSubscript:v4];
  [v5 CGRectValue];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (double)finalAlphaForAccessory:(id)a3
{
  finalAlphas = self->_finalAlphas;
  uint64_t v4 = [a3 identifier];
  double v5 = [(NSMutableDictionary *)finalAlphas objectForKeyedSubscript:v4];
  [v5 doubleValue];
  double v7 = v6;

  return v7;
}

void __84__UITableCellAccessoryLayout__framesForAccessories_withContainerSize_outTotalFrame___block_invoke(double *a1, void *a2, uint64_t a3)
{
  double v5 = (void *)*((void *)a1 + 4);
  uint64_t v6 = *((void *)a1 + 5);
  uint64_t v7 = *(void *)(*((void *)a1 + 7) + 8) + 24;
  double v8 = a1[8];
  double v9 = a1[9];
  id v10 = a2;
  objc_msgSend(v5, "_frameForAccessoryAtIndex:inAccessories:containerSize:withXOrigin:", a3, v6, v7, v8, v9);
  objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:");
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  double v11 = (void *)*((void *)a1 + 6);
  double v12 = [v10 identifier];

  [v11 setObject:v13 forKeyedSubscript:v12];
}

void __111__UITableCellAccessoryLayout_prepareLayoutForAccessories_previousAccessories_configurationIdentifier_animated___block_invoke_12(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v24 = [v5 identifier];
  uint64_t v6 = [v5 view];

  if ([*(id *)(a1 + 32) containsObject:v24])
  {
    if (*(unsigned char *)(a1 + 128)) {
      int v7 = (*(uint64_t (**)(void))(*(void *)(a1 + 104) + 16))() ^ 1;
    }
    else {
      int v7 = 0;
    }
    double v8 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
    [*(id *)(a1 + 48) setObject:v8 forKeyedSubscript:v24];

    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 56), "_frameForAccessoryAtIndex:inAccessories:containerSize:withXOrigin:", a3, *(void *)(a1 + 40), *(void *)(*(void *)(a1 + 88) + 8) + 24, *(double *)(a1 + 112), *(double *)(a1 + 120));
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
    }
    else
    {
      double v16 = [*(id *)(a1 + 72) objectForKeyedSubscript:v24];
      [v16 CGRectValue];
      double v18 = v17;
      double v11 = v19;
      double v13 = v20;
      double v15 = v21;

      double v9 = v18 + *(double *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
    }
    double v22 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v9, v11, v13, v15);
    [*(id *)(a1 + 64) setObject:v22 forKeyedSubscript:v24];

    LODWORD(v22) = [*(id *)(a1 + 80) containsObject:v6];
    [*(id *)(*(void *)(a1 + 56) + 72) setObject:&unk_1ED3F26A8 forKeyedSubscript:v24];
    if (v22) {
      double v23 = &unk_1ED3F26A8;
    }
    else {
      double v23 = &unk_1ED3F2698;
    }
    [*(id *)(*(void *)(a1 + 56) + 80) setObject:v23 forKeyedSubscript:v24];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finalAlphas, 0);
  objc_storeStrong((id *)&self->_initialAlphas, 0);
  objc_storeStrong((id *)&self->_finalFrames, 0);
  objc_storeStrong((id *)&self->_initialFrames, 0);
  objc_storeStrong(&self->_spacingBlock, 0);
  objc_storeStrong(&self->_disclosureLayoutWidthProvider, 0);
  objc_storeStrong(&self->_standardLayoutWidthProvider, 0);
  objc_destroyWeak((id *)&self->_manager);
}

- (double)_disclosureLayoutWidth
{
  disclosureLayoutWidthProvider = (void (**)(void))self->_disclosureLayoutWidthProvider;
  if (!disclosureLayoutWidthProvider) {
    return 0.0;
  }
  disclosureLayoutWidthProvider[2]();
  return result;
}

uint64_t __111__UITableCellAccessoryLayout_prepareLayoutForAccessories_previousAccessories_configurationIdentifier_animated___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  if ([v5 count] <= a3)
  {
    uint64_t v9 = 0;
  }
  else
  {
    do
    {
      uint64_t v6 = [v5 objectAtIndexedSubscript:a3];
      int v7 = *(void **)(a1 + 32);
      double v8 = [v6 identifier];
      uint64_t v9 = [v7 containsObject:v8];

      if (v9) {
        break;
      }
      ++a3;
    }
    while (a3 < [v5 count]);
  }

  return v9;
}

- (UICellAccessoryManager)manager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  return (UICellAccessoryManager *)WeakRetained;
}

- (unint64_t)edge
{
  return self->_edge;
}

- (double)safeAreaInset
{
  return self->_safeAreaInset;
}

- (id)standardLayoutWidthProvider
{
  return self->_standardLayoutWidthProvider;
}

- (id)disclosureLayoutWidthProvider
{
  return self->_disclosureLayoutWidthProvider;
}

- (id)spacingBlock
{
  return self->_spacingBlock;
}

- (CGRect)totalFrame
{
  double x = self->_totalFrame.origin.x;
  double y = self->_totalFrame.origin.y;
  double width = self->_totalFrame.size.width;
  double height = self->_totalFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTotalFrame:(CGRect)a3
{
  self->_totalFrame = a3;
}

- (NSDictionary)initialFrames
{
  return self->_initialFrames;
}

- (void)setInitialFrames:(id)a3
{
}

- (NSDictionary)finalFrames
{
  return self->_finalFrames;
}

- (void)setFinalFrames:(id)a3
{
}

- (NSMutableDictionary)initialAlphas
{
  return self->_initialAlphas;
}

- (void)setInitialAlphas:(id)a3
{
}

- (NSMutableDictionary)finalAlphas
{
  return self->_finalAlphas;
}

- (void)setFinalAlphas:(id)a3
{
}

@end