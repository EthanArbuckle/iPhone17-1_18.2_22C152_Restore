@interface PKPassTileGroupView
+ (void)extractSupportedVehicleFunction:(id *)a3 action:(id *)a4 forTile:(id)a5 applicationIdentifier:(id)a6 keyIdentifier:(id)a7;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKPass)pass;
- (PKPassTileGroupView)init;
- (PKPassTileGroupView)initWithCoder:(id)a3;
- (PKPassTileGroupViewDelegate)delegate;
- (UIEdgeInsets)contentInset;
- (_BYTE)_updateSubviewsAnimated:(unsigned char *)result;
- (double)_populateHandleSizeCachesWithWidth:(double)a3 recompute:;
- (void)_displayViewController:(void *)a1;
- (void)_openURL:(void *)a1;
- (void)_performDisplayAuxiliaryPassInformationItemAction:(void *)a1;
- (void)_performDisplayTileContextAction:(void *)a1;
- (void)_performOpenExternalURLAction:(void *)a1;
- (void)_performViewImageAction:(void *)a3 sourceImageView:;
- (void)_tileViewPinched:(id)a3;
- (void)_tileViewTapped:(id)a3;
- (void)_updateRowItemViews:(void *)a3 withRowItems:(char)a4 isLastRow:(int)a5 animated:;
- (void)layoutIfNeededAnimated:(BOOL)a3;
- (void)layoutSubviews;
- (void)performBatchUpdates:(id)a3 animated:(BOOL)a4;
- (void)prepareForReuse;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setDelegate:(id)a3;
- (void)setPass:(id)a3 passView:(id)a4 groupTile:(id)a5 context:(id *)a6 animated:(BOOL)a7;
@end

@implementation PKPassTileGroupView

+ (void)extractSupportedVehicleFunction:(id *)a3 action:(id *)a4 forTile:(id)a5 applicationIdentifier:(id)a6 keyIdentifier:(id)a7
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  v14 = v13;
  v15 = 0;
  if (!v11 || !v12)
  {
    v16 = 0;
    goto LABEL_29;
  }
  v16 = 0;
  if (!v13)
  {
LABEL_29:
    id v36 = *a3;
    *a3 = 0;

    id v37 = *a4;
    *a4 = 0;
    goto LABEL_30;
  }
  v17 = [v11 metadata];
  v18 = [v17 metadataTypeVehicleFunction];
  v16 = [v18 vehicleFunctions];

  if (![v16 count])
  {
    v22 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v57 = v12;
      __int16 v58 = 2112;
      v59 = v14;
      _os_log_impl(&dword_19F450000, v22, OS_LOG_TYPE_DEFAULT, "PKPassTileGroupView: no vehicle functions to check for (%@: %@).", buf, 0x16u);
    }
    v15 = 0;
    goto LABEL_28;
  }
  v19 = (void *)MEMORY[0x1E4F84B58];
  v20 = [v11 state];
  v21 = [v20 actions];
  v22 = [v19 effectiveActionForActions:v21];

  v15 = [v22 vehicleFunctionActions];
  if (![v15 count])
  {
    v35 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v57 = v12;
      __int16 v58 = 2112;
      v59 = v14;
      _os_log_impl(&dword_19F450000, v35, OS_LOG_TYPE_DEFAULT, "PKPassTileGroupView: no vehicle function action map for (%@: %@).", buf, 0x16u);
    }

LABEL_28:
    goto LABEL_29;
  }
  v49 = a4;
  v50 = v16;

  id v55 = 0;
  v23 = [(id)PKGetClassNFDigitalCarKeySession() vehicleReports:&v55];
  id v24 = v55;
  v48 = v23;
  v25 = [v23 objectForKeyedSubscript:v14];
  v47 = v24;
  if (!v25 || v24)
  {
    v26 = PKLogFacilityTypeGetObject();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_39;
    }
    *(_DWORD *)buf = 138412802;
    id v57 = v12;
    __int16 v58 = 2112;
    v59 = v14;
    __int16 v60 = 2112;
    id v61 = v24;
    v34 = "PKPassTileGroupView: failed to fetch vehicle report for (%@: %@) - %@.";
    v38 = v26;
    uint32_t v39 = 32;
    goto LABEL_38;
  }
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  v26 = v50;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v51 objects:v62 count:16];
  if (!v27)
  {

LABEL_35:
    v26 = PKLogFacilityTypeGetObject();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_39;
    }
    *(_DWORD *)buf = 138412546;
    id v57 = v12;
    __int16 v58 = 2112;
    v59 = v14;
    v34 = "PKPassTileGroupView: failed to identify supported function for (%@: %@).";
    goto LABEL_37;
  }
  uint64_t v28 = v27;
  v45 = v14;
  id v46 = v12;
  char v29 = 0;
  uint64_t v30 = *(void *)v52;
  while (2)
  {
    for (uint64_t i = 0; i != v28; ++i)
    {
      if (*(void *)v52 != v30) {
        objc_enumerationMutation(v26);
      }
      v32 = *(void **)(*((void *)&v51 + 1) + 8 * i);
      if (objc_msgSend(v25, "isRKEFunctionSupported:", v32, v45, v46, v47))
      {
        uint64_t v33 = [v15 objectForKeyedSubscript:v32];
        if (v33)
        {
          v40 = (void *)v33;
          id v41 = v32;
          v14 = v45;
          id v12 = v46;
          goto LABEL_40;
        }
        char v29 = 1;
      }
    }
    uint64_t v28 = [v26 countByEnumeratingWithState:&v51 objects:v62 count:16];
    if (v28) {
      continue;
    }
    break;
  }

  v14 = v45;
  id v12 = v46;
  if ((v29 & 1) == 0) {
    goto LABEL_35;
  }
  v26 = PKLogFacilityTypeGetObject();
  if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_39;
  }
  *(_DWORD *)buf = 138412546;
  id v57 = v46;
  __int16 v58 = 2112;
  v59 = v45;
  v34 = "PKPassTileGroupView: failed to map supported function to action for (%@: %@).";
LABEL_37:
  v38 = v26;
  uint32_t v39 = 22;
LABEL_38:
  _os_log_impl(&dword_19F450000, v38, OS_LOG_TYPE_DEFAULT, v34, buf, v39);
LABEL_39:
  id v41 = 0;
  v40 = 0;
LABEL_40:

  id v42 = *a3;
  *a3 = v41;
  id v37 = v41;

  id v43 = *v49;
  id *v49 = v40;
  id v44 = v40;

  v16 = v50;
LABEL_30:
}

- (PKPassTileGroupView)initWithCoder:(id)a3
{
  return 0;
}

- (PKPassTileGroupView)init
{
  v6.receiver = self;
  v6.super_class = (Class)PKPassTileGroupView;
  v2 = -[PKPassTileGroupView initWithFrame:](&v6, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    itemViewsByRows = v2->_itemViewsByRows;
    v2->_itemViewsByRows = v3;

    v2->_maximumRows = 1;
  }
  return v2;
}

- (double)_populateHandleSizeCachesWithWidth:(double)a3 recompute:
{
  if (!a1) {
    return 0.0;
  }
  uint64_t v14 = 0;
  v15 = (double *)&v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v3 = *(void **)(a1 + 504);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__PKPassTileGroupView__populateHandleSizeCachesWithWidth_recompute___block_invoke;
  v8[3] = &unk_1E59CFE00;
  *(double *)&v8[7] = a3;
  char v9 = a2;
  v8[4] = a1;
  v8[5] = &v10;
  v8[6] = &v14;
  [v3 enumerateObjectsUsingBlock:v8];
  unint64_t v4 = v11[3];
  double v5 = (double)(v4 - 1);
  if (v4 <= 1) {
    double v5 = 0.0;
  }
  double v6 = v15[3] + v5 * 8.0;
  v15[3] = v6;
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  return v6;
}

void __68__PKPassTileGroupView__populateHandleSizeCachesWithWidth_recompute___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count])
  {
    if (*(unsigned char *)(*(void *)(a1 + 32) + 480))
    {
      uint64_t v4 = [v3 firstObject];
      double v5 = (void *)v4;
      if (v4) {
        double v6 = *(void **)(v4 + 16);
      }
      else {
        double v6 = 0;
      }
      id v7 = v6;

      v8 = [v7 content];

      char v9 = [v8 metadata];
      [v9 preferredStyle];
    }
    uint64_t v18 = 0;
    v19 = (double *)&v18;
    uint64_t v20 = 0x2020000000;
    uint64_t v21 = 0;
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 0;
    PKFloatRoundToPixel();
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __68__PKPassTileGroupView__populateHandleSizeCachesWithWidth_recompute___block_invoke_2;
    v12[3] = &unk_1E59CFDB0;
    char v13 = *(unsigned char *)(a1 + 64);
    v12[6] = v10;
    v12[4] = &v18;
    v12[5] = &v14;
    [v3 enumerateObjectsUsingBlock:v12];
    if (*((unsigned char *)v15 + 24))
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __68__PKPassTileGroupView__populateHandleSizeCachesWithWidth_recompute___block_invoke_3;
      v11[3] = &unk_1E59CFDD8;
      v11[4] = &v18;
      [v3 enumerateObjectsUsingBlock:v11];
    }
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v19[3]
                                                                + *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&v18, 8);
  }
}

void __68__PKPassTileGroupView__populateHandleSizeCachesWithWidth_recompute___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v14 = (double *)v3;
  if (v3) {
    uint64_t v4 = (void *)v3[2];
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;
  double v6 = v5;
  if (*(unsigned char *)(a1 + 56))
  {
    objc_msgSend(v5, "sizeThatFits:", *(double *)(a1 + 48), 1.79769313e308);
  }
  else
  {
    [v5 frame];
    uint64_t v7 = v9;
    double v8 = v10;
  }
  if (v14)
  {
    *((void *)v14 + 3) = v7;
    v14[4] = v8;
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
  double v12 = *(double *)(v11 + 24);
  if (v12 != 0.0 && v12 != v8)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
    double v12 = *(double *)(v11 + 24);
  }
  *(double *)(v11 + 24) = fmax(v12, v8);
}

double __68__PKPassTileGroupView__populateHandleSizeCachesWithWidth_recompute___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    double result = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    *(double *)(a2 + 32) = result;
  }
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  if ([(NSArray *)self->_content count])
  {
    double v5 = -[PKPassTileGroupView _populateHandleSizeCachesWithWidth:recompute:]((uint64_t)self, 1, width - (self->_contentInset.left + self->_contentInset.right));
  }
  else
  {
    double width = *MEMORY[0x1E4F1DB30];
    double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  double v6 = width;
  result.height = v5;
  result.double width = v6;
  return result;
}

- (void)layoutSubviews
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  v66.receiver = self;
  v66.super_class = (Class)PKPassTileGroupView;
  [(PKPassTileGroupView *)&v66 layoutSubviews];
  [(PKPassTileGroupView *)self bounds];
  double left = self->_contentInset.left;
  double right = self->_contentInset.right;
  double v6 = v3 - (left + right);
  double v8 = v7 - (self->_contentInset.top + self->_contentInset.bottom);
  char v9 = self->_boundsSize.height != v8 || self->_boundsSize.width != v6;
  self->_boundsSize.double width = v6;
  self->_boundsSize.height = v8;
  -[PKPassTileGroupView _populateHandleSizeCachesWithWidth:recompute:]((uint64_t)self, v9, v3 - (left + right));
  unsigned int v10 = [(PKPassTileGroupView *)self _shouldReverseLayoutDirection];
  if (v10) {
    CGRectEdge v11 = CGRectMaxXEdge;
  }
  else {
    CGRectEdge v11 = CGRectMinXEdge;
  }
  PKSizeAlignedInRect();
  memset(&v64, 0, sizeof(v64));
  remainder.origin.x = v12;
  remainder.origin.y = v13;
  remainder.size.double width = v14;
  remainder.size.height = v15;
  uint64_t v55 = [(NSMutableArray *)self->_itemViewsByRows count];
  if (v55)
  {
    uint64_t v16 = 0;
    double v58 = (double)v10;
    double v17 = (double)(v10 ^ 1);
    do
    {
      uint64_t v18 = [(NSMutableArray *)self->_itemViewsByRows objectAtIndexedSubscript:v16];
      uint64_t v19 = [v18 count];
      if (v19)
      {
        unint64_t v20 = v19;
        long long v62 = 0u;
        long long v63 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        v56 = v18;
        id v21 = v18;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v60 objects:v67 count:16];
        uint64_t v57 = v16;
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v61;
          double v25 = 0.0;
          do
          {
            uint64_t v26 = 0;
            do
            {
              if (*(void *)v61 != v24) {
                objc_enumerationMutation(v21);
              }
              uint64_t v27 = *(void *)(*((void *)&v60 + 1) + 8 * v26);
              if (v27) {
                double v28 = *(double *)(v27 + 32);
              }
              else {
                double v28 = 0.0;
              }
              double v25 = fmax(v28, v25);
              ++v26;
            }
            while (v23 != v26);
            uint64_t v29 = [v21 countByEnumeratingWithState:&v60 objects:v67 count:16];
            uint64_t v23 = v29;
          }
          while (v29);
        }
        else
        {
          double v25 = 0.0;
        }

        memset(&slice, 0, sizeof(slice));
        CGRectDivide(remainder, &slice, &remainder, v25, CGRectMinYEdge);
        CGRectDivide(remainder, &v64, &remainder, 8.0, CGRectMinYEdge);
        uint64_t v30 = 0;
        unint64_t v31 = v20 - 1;
        if (v20 <= 1) {
          uint64_t v32 = 1;
        }
        else {
          uint64_t v32 = v20;
        }
        do
        {
          uint64_t v33 = [v21 objectAtIndexedSubscript:v30];
          uint64_t v34 = v33;
          if (v33)
          {
            BOOL v35 = *(unsigned char *)(v33 + 8) != 0;
            id v36 = *(void **)(v33 + 16);
          }
          else
          {
            BOOL v35 = 0;
            id v36 = 0;
          }
          double v37 = 0.5;
          if (v31 == v30) {
            double v37 = v17;
          }
          if (v30) {
            double v38 = v37;
          }
          else {
            double v38 = v58;
          }
          id v39 = v36;
          v40 = [v39 layer];
          [v40 anchorPoint];
          double v43 = v42;
          double v44 = v41;
          if (v38 != v42 || v41 != 0.0)
          {
            [v40 bounds];
            double v46 = v45;
            double v48 = v47;
            [v40 position];
            double v50 = v49;
            double v52 = v51;
            objc_msgSend(v40, "setAnchorPoint:", v38, 0.0);
            if (!v35) {
              objc_msgSend(v40, "setPosition:", v50 - v43 * v46 + v38 * v46, v52 - v44 * v48 + v48 * 0.0);
            }
          }

          if (v34) {
            CGFloat v53 = *(double *)(v34 + 24);
          }
          else {
            CGFloat v53 = 0.0;
          }
          CGRectDivide(slice, &v64, &slice, v53, v11);
          PKSizeAlignedInRect();
          BOOL v54 = self->_animated && !v35;
          objc_msgSend(v39, "pkui_setFrame:animated:", v54);
          [v39 layoutIfNeededAnimated:v54];

          if (v34) {
            *(unsigned char *)(v34 + 8) = 0;
          }
          CGRectDivide(slice, &v64, &slice, 8.0, v11);

          ++v30;
        }
        while (v32 != v30);
        uint64_t v18 = v56;
        uint64_t v16 = v57;
      }

      ++v16;
    }
    while (v16 != v55);
  }
}

- (void)performBatchUpdates:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double v6 = (void (**)(void))a3;
  if (v6)
  {
    double v7 = v6;
    if (self->_deferringUpdate)
    {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"PKPassTileGroupView recursive batch updates are not supported."];
      double v6 = v7;
    }
    self->_deferringUpdate = 1;
    v6[2]();
    self->_deferringUpdate = 0;
    if (self->_deferredSubviewUpdate)
    {
      self->_deferredSubviewUpdate = 0;
      -[PKPassTileGroupView _updateSubviewsAnimated:](self, v4);
    }
    else
    {
      [(PKPassTileGroupView *)self layoutIfNeededAnimated:v4];
    }
    double v6 = v7;
  }
}

- (_BYTE)_updateSubviewsAnimated:(unsigned char *)result
{
  if (result)
  {
    v2 = result;
    if (result[521])
    {
      result[522] = 1;
    }
    else
    {
      [result layoutIfNeeded];
      *(_OWORD *)(v2 + 424) = *MEMORY[0x1E4F1DB30];
      unint64_t v4 = [*((id *)v2 + 61) count];
      unint64_t v5 = [*((id *)v2 + 63) count];
      if (v4)
      {
        for (unint64_t i = 0; i != v4; ++i)
        {
          if (i >= v5
            || ([*((id *)v2 + 63) objectAtIndexedSubscript:i],
                (id v7 = (id)objc_claimAutoreleasedReturnValue()) == 0))
          {
            id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            [*((id *)v2 + 63) addObject:v7];
          }
          double v8 = [*((id *)v2 + 61) objectAtIndexedSubscript:i];
          -[PKPassTileGroupView _updateRowItemViews:withRowItems:isLastRow:animated:]((id *)v2, v7, v8, v4 - 1 == i, a2);
        }
      }
      if (v4 < v5)
      {
        char v9 = (void *)MEMORY[0x1E4F1CBF0];
        do
        {
          unsigned int v10 = [*((id *)v2 + 63) objectAtIndexedSubscript:v4];
          -[PKPassTileGroupView _updateRowItemViews:withRowItems:isLastRow:animated:]((id *)v2, v10, v9, 0, a2);

          ++v4;
        }
        while (v5 != v4);
      }
      [v2 setNeedsLayout];
      return (unsigned char *)[v2 layoutIfNeededAnimated:a2];
    }
  }
  return result;
}

- (void)layoutIfNeededAnimated:(BOOL)a3
{
  self->_animated = a3;
  [(PKPassTileGroupView *)self layoutIfNeeded];
  self->_animated = 0;
}

- (void)prepareForReuse
{
  memset(v2, 0, sizeof(v2));
  [(PKPassTileGroupView *)self setPass:0 passView:0 groupTile:0 context:v2 animated:0];
}

- (void)_updateRowItemViews:(void *)a3 withRowItems:(char)a4 isLastRow:(int)a5 animated:
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  uint64_t v55 = [v8 count];
  long long v61 = v7;
  v56 = v8;
  CGFloat v53 = objc_msgSend(v7, "pk_createArrayByApplyingBlock:", &__block_literal_global_53);
  objc_msgSend(v8, "differenceFromArray:withOptions:usingEquivalenceTest:");
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [obj countByEnumeratingWithState:&v74 objects:v83 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v75;
    uint64_t v57 = *(void *)v75;
    do
    {
      uint64_t v12 = 0;
      CGFloat v13 = sel__tileViewTapped_;
      uint64_t v58 = v10;
      do
      {
        if (*(void *)v75 != v11) {
          objc_enumerationMutation(obj);
        }
        CGFloat v14 = *(void **)(*((void *)&v74 + 1) + 8 * v12);
        uint64_t v15 = [v14 index];
        uint64_t v16 = [v14 changeType];
        if (v16 == 1)
        {
          double v17 = [v14 object];
          uint64_t v24 = [v61 objectAtIndexedSubscript:v15];
          [v61 removeObjectAtIndex:v15];
          if (v24) {
            layeringSceneIdentity = v24->super.super.super.super.__layeringSceneIdentity;
          }
          else {
            layeringSceneIdentity = 0;
          }
          uint64_t v27 = layeringSceneIdentity;
          [a1 sendSubviewToBack:v27];
          double v28 = v13;
          [(FBSSceneIdentityToken *)v27 removeTarget:a1 action:v13 forControlEvents:64];
          long long v73 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          long long v70 = 0u;
          uint64_t v29 = [(FBSSceneIdentityToken *)v27 gestureRecognizers];
          uint64_t v30 = [v29 countByEnumeratingWithState:&v70 objects:v82 count:16];
          if (v30)
          {
            uint64_t v31 = v30;
            uint64_t v32 = *(void *)v71;
            do
            {
              for (uint64_t i = 0; i != v31; ++i)
              {
                if (*(void *)v71 != v32) {
                  objc_enumerationMutation(v29);
                }
                [(FBSSceneIdentityToken *)v27 removeGestureRecognizer:*(void *)(*((void *)&v70 + 1) + 8 * i)];
              }
              uint64_t v31 = [v29 countByEnumeratingWithState:&v70 objects:v82 count:16];
            }
            while (v31);
          }

          uint64_t v34 = v27;
          uint64_t v23 = v34;
          if (a5)
          {
            BOOL v35 = [(PKPassTileGroupView_ViewHandle *)v34 layer];
            id v36 = [MEMORY[0x1E4F85060] springAnimationWithKeyPath:@"opacity"];
            [v35 opacity];
            objc_msgSend(v36, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v37, 0.0);
            v78.receiver = (id)MEMORY[0x1E4F143A8];
            v78.super_class = (Class)3221225472;
            v79 = __RemoveViewFromSuperview_block_invoke;
            v80 = &unk_1E59CB6D8;
            v81 = v23;
            objc_msgSend(v36, "pkui_setCompletionHandler:", &v78);
            [v35 setOpacity:0.0];
            id v38 = (id)objc_msgSend(v35, "pkui_addAdditiveAnimation:", v36);
            [v36 duration];
          }
          else
          {
            [(PKPassTileGroupView_ViewHandle *)v34 removeFromSuperview];
          }
          uint64_t v11 = v57;

          CGFloat v13 = v28;
          uint64_t v10 = v58;
        }
        else
        {
          if (v16) {
            goto LABEL_28;
          }
          double v17 = [v14 object];
          uint64_t v18 = objc_alloc_init(PKPassTileView);
          [(PKPassTileView *)v18 addTarget:a1 action:v13 forControlEvents:64];
          uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4FB1AA0]) initWithTarget:a1 action:sel__tileViewPinched_];
          [(PKPassTileView *)v18 addGestureRecognizer:v19];

          [a1 insertSubview:v18 atIndex:0];
          if (a5)
          {
            unint64_t v20 = [MEMORY[0x1E4F85060] springAnimationWithKeyPath:@"opacity"];
            objc_msgSend(v20, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", 0.0, 1.0);
            id v21 = [(PKPassTileView *)v18 layer];
            id v22 = (id)objc_msgSend(v21, "pkui_addAdditiveAnimation:", v20);
          }
          uint64_t v23 = [PKPassTileGroupView_ViewHandle alloc];
          uint64_t v24 = v18;
          if (v23)
          {
            v78.receiver = v23;
            v78.super_class = (Class)PKPassTileGroupView_ViewHandle;
            double v25 = (PKPassTileGroupView_ViewHandle *)objc_msgSendSuper2(&v78, sel_init);
            uint64_t v23 = v25;
            if (v25)
            {
              v25->_initialLayout = 1;
              objc_storeStrong((id *)&v25->_view, v18);
            }
          }

          [v61 insertObject:v23 atIndex:v15];
        }

LABEL_28:
        ++v12;
      }
      while (v12 != v10);
      uint64_t v39 = [obj countByEnumeratingWithState:&v74 objects:v83 count:16];
      uint64_t v10 = v39;
    }
    while (v39);
  }
  v40 = [a1[57] metadata];
  double v41 = [v40 metadataTypeHorizontalFlowGroup];
  uint64_t v42 = [v41 groupStyle];

  uint64_t v43 = v55;
  if (v55)
  {
    for (uint64_t j = 0; j != v55; ++j)
    {
      uint64_t v45 = [v61 objectAtIndexedSubscript:j];
      double v46 = (unsigned char *)v45;
      if (v45) {
        double v47 = *(void **)(v45 + 16);
      }
      else {
        double v47 = 0;
      }
      id v48 = v47;
      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v62[2] = __75__PKPassTileGroupView__updateRowItemViews_withRowItems_isLastRow_animated___block_invoke_3;
      v62[3] = &unk_1E59CFE68;
      id v49 = v56;
      char v69 = a4;
      id v63 = v49;
      CGRect v64 = a1;
      id v65 = v48;
      uint64_t v66 = j;
      uint64_t v67 = v43;
      uint64_t v68 = v42;
      if (a5)
      {
        if (v46) {
          BOOL v50 = v46[8] != 0;
        }
        else {
          BOOL v50 = 0;
        }
        BOOL v51 = !v50;
      }
      else
      {
        BOOL v51 = 0;
      }
      id v52 = v48;
      [v52 performBatchUpdates:v62 animated:v51];

      uint64_t v43 = v55;
    }
  }
}

uint64_t __75__PKPassTileGroupView__updateRowItemViews_withRowItems_isLastRow_animated___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    v2 = *(void **)(a2 + 16);
  }
  else {
    v2 = 0;
  }
  return [v2 content];
}

uint64_t __75__PKPassTileGroupView__updateRowItemViews_withRowItems_isLastRow_animated___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = [a2 metadata];
  double v6 = [v5 identifier];
  id v7 = [v4 metadata];

  id v8 = [v7 identifier];
  id v9 = v6;
  id v10 = v8;
  uint64_t v11 = v10;
  if (v9 == v10)
  {
    uint64_t v12 = 1;
  }
  else
  {
    uint64_t v12 = 0;
    if (v9 && v10) {
      uint64_t v12 = [v9 isEqualToString:v10];
    }
  }

  return v12;
}

void __75__PKPassTileGroupView__updateRowItemViews_withRowItems_isLastRow_animated___block_invoke_3(uint64_t a1)
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = [*(id *)(a1 + 32) objectAtIndexedSubscript:*(void *)(a1 + 56)];
  v2 = (void *)v1;
  uint64_t v3 = a1;
  if (*(unsigned char *)(a1 + 80))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 64);
    uint64_t v6 = *(void *)(a1 + 56) + 1;
    BOOL v7 = v6 == v5;
    BOOL v8 = *(void *)(v4 + 528) == 1 && v6 == v5;
    uint64_t v48 = a1 + 40;
    if (!v8) {
      goto LABEL_36;
    }
    [*(id *)(v4 + 496) insertObject:v1 atIndex:0];
    if (*(void *)(a1 + 40))
    {
      id v9 = (void *)[MEMORY[0x1E4F848F8] _createMetadataForType:0 identifier:@"PKPassTileContextMenuTileIdentifier" context:0];
      [v9 setPreferredStyle:1];
      id v10 = (void *)[MEMORY[0x1E4F84900] createResolvedStateWithType:1];
      [v10 setPreferredStyle:5];
      uint64_t v11 = (void *)MEMORY[0x1E4F84920];
      uint64_t v12 = PKLocalizedTicketingString(&cfstr_TileContextMen.isa);
      CGFloat v13 = (void *)[v11 createWithContent:v12];
      [v10 setBody:v13];

      CGFloat v14 = (void *)[MEMORY[0x1E4F848F0] createWithSymbolName:@"ellipsis" tintColor:14];
      [v10 setIcon:v14];

      id v50 = (id)[objc_alloc(MEMORY[0x1E4F848D8]) _initWithMetadata:v9 childTiles:0 stateIdentifier:@"PKPassTileContextMenuTileIdentifier" state:v10 inProgress:0];
      [v50 setAxID:*MEMORY[0x1E4F856F8]];
    }
    else
    {
      id v50 = 0;
    }

    uint64_t v15 = *(id **)(a1 + 40);
    double v47 = *(void **)(a1 + 48);
    if (!v15)
    {
LABEL_34:
      objc_msgSend(v47, "setMenu:", v15, v47);

      uint64_t v3 = a1;
      BOOL v7 = 1;
      [*(id *)(a1 + 48) setShowsMenuAsPrimaryAction:1];
      goto LABEL_37;
    }
    id v52 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    val = v15;
    obuint64_t j = v15[62];
    uint64_t v54 = [obj countByEnumeratingWithState:&v60 objects:v65 count:16];
    if (!v54) {
      goto LABEL_33;
    }
    uint64_t v53 = *(void *)v61;
LABEL_12:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v61 != v53) {
        objc_enumerationMutation(obj);
      }
      double v17 = objc_msgSend(*(id *)(*((void *)&v60 + 1) + 8 * v16), "state", v47);
      uint64_t v18 = (void *)MEMORY[0x1E4F84B58];
      uint64_t v19 = [v17 actions];
      unint64_t v20 = [v18 effectiveActionForActions:v19];

      if (!v20) {
        goto LABEL_31;
      }
      id v21 = [v17 icon];
      uint64_t v22 = [v17 type];
      if (v22 == 1) {
        break;
      }
      if (!v22)
      {
        uint64_t v23 = [v17 stateTypeDefault];
        v56 = [v23 body];
        goto LABEL_20;
      }
      v56 = 0;
      if (v21)
      {
LABEL_21:
        uint64_t v26 = [v21 image];
        uint64_t v27 = [MEMORY[0x1E4FB1618] tintColor];
        if (v26)
        {
          double v28 = [MEMORY[0x1E4FB1818] imageWithPKImage:v26];
          uint64_t v29 = [v28 imageWithTintColor:v27];
        }
        else
        {
          uint64_t v30 = [v21 contextMenuSymbolName];
          uint64_t v31 = v30;
          if (v30)
          {
            id v32 = v30;
          }
          else
          {
            id v32 = [v21 symbolName];
          }
          double v28 = v32;

          uint64_t v33 = (void *)MEMORY[0x1E4FB1818];
          uint64_t v34 = (void *)MEMORY[0x1E4FB1830];
          CGRect v64 = v27;
          BOOL v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v64 count:1];
          id v36 = [v34 configurationWithPaletteColors:v35];
          uint64_t v29 = [v33 _systemImageNamed:v28 withConfiguration:v36];
        }
        goto LABEL_30;
      }
LABEL_24:
      uint64_t v29 = 0;
LABEL_30:
      objc_initWeak(&location, val);
      float v37 = (void *)MEMORY[0x1E4FB13F0];
      v57[0] = MEMORY[0x1E4F143A8];
      v57[1] = 3221225472;
      v57[2] = __35__PKPassTileGroupView__contextMenu__block_invoke;
      v57[3] = &unk_1E59CFF30;
      objc_copyWeak(&v58, &location);
      v57[4] = v20;
      v57[5] = val;
      id v38 = [v37 actionWithTitle:v56 image:v29 identifier:0 handler:v57];
      [v52 addObject:v38];

      objc_destroyWeak(&v58);
      objc_destroyWeak(&location);

LABEL_31:
      if (v54 == ++v16)
      {
        uint64_t v54 = [obj countByEnumeratingWithState:&v60 objects:v65 count:16];
        if (!v54)
        {
LABEL_33:

          uint64_t v15 = [MEMORY[0x1E4FB1970] menuWithChildren:v52];

          goto LABEL_34;
        }
        goto LABEL_12;
      }
    }
    uint64_t v23 = [v17 stateTypeDefaultV2];
    uint64_t v24 = [v23 body];
    double v25 = [v24 valueTypeText];
    v56 = [v25 content];

LABEL_20:
    if (v21) {
      goto LABEL_21;
    }
    goto LABEL_24;
  }
  BOOL v7 = 0;
  uint64_t v48 = a1 + 40;
LABEL_36:
  id v50 = (id)v1;
LABEL_37:
  v40 = *(void **)(v3 + 48);
  uint64_t v39 = v3 + 48;
  [v40 setCompact:*(void *)(v39 + 16) > 1uLL];
  [*(id *)v39 setGroupStyle:*(void *)(v39 + 24)];
  uint64_t v41 = *(void *)(v39 - 8);
  id v42 = *(id *)v39;
  uint64_t v43 = (id *)v39;
  uint64_t v44 = *(void *)(v41 + 408);
  uint64_t v45 = [*(id *)(v41 + 536) uniqueID];
  [v42 setPassView:v44 passUniqueID:v45];

  [*v43 setContent:v50];
  if (v7) {
    uint64_t v46 = *(void *)(*(void *)v48 + 528);
  }
  else {
    uint64_t v46 = 0;
  }
  [*v43 setOverflowType:v46];
}

- (void)_performOpenExternalURLAction:(void *)a1
{
  if (a1)
  {
    uint64_t v3 = [a2 externalURL];
    if (v3)
    {
      uint64_t v4 = v3;
      -[PKPassTileGroupView _openURL:](a1, v3);
      uint64_t v3 = v4;
    }
  }
}

- (void)_openURL:(void *)a1
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F224A0]);
  [v4 setSensitive:0];
  uint64_t v8 = *MEMORY[0x1E4F62688];
  v9[0] = MEMORY[0x1E4F1CC38];
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  [v4 setFrontBoardOptions:v5];

  if ((PKRunningInViewService() & 1) != 0 || PKRunningInLockScreenPlugin())
  {
    uint64_t v6 = [a1 window];
    BOOL v7 = v6;
    if (v6) {
      PKPostOpenApplicationNotification(v6, v3, v4);
    }
  }
  else
  {
    PKOpenApplication(v3, v4);
  }
}

- (void)_performDisplayAuxiliaryPassInformationItemAction:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = (void *)a1[67];
    if (v4)
    {
      uint64_t v5 = [v4 uniqueID];
      if (v5)
      {
        uint64_t v6 = (void *)v5;
        BOOL v7 = [v3 auxiliaryPassInformationIdentifier];
        uint64_t v8 = [v3 auxiliaryPassInformationItemIdentifier];
        if (!v8)
        {
LABEL_13:

          goto LABEL_14;
        }
        if ((PKRunningInViewService() & 1) != 0 || PKRunningInLockScreenPlugin())
        {
          id v9 = objc_alloc_init(MEMORY[0x1E4F29088]);
          [v9 setScheme:*MEMORY[0x1E4F88088]];
          [v9 setHost:*MEMORY[0x1E4F88048]];
          id v10 = NSString;
          [v3 type];
          uint64_t v11 = PKPaymentPassActionTypeToString();
          uint64_t v12 = [v10 stringWithFormat:@"/%@/%@", v6, v11];
          [v9 setPath:v12];

          id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          if (v7)
          {
            CGFloat v14 = [MEMORY[0x1E4F290C8] queryItemWithName:*MEMORY[0x1E4F88008] value:v7];
            [v13 addObject:v14];
          }
          uint64_t v15 = [MEMORY[0x1E4F290C8] queryItemWithName:*MEMORY[0x1E4F88010] value:v8];
          [v13 addObject:v15];

          uint64_t v16 = (void *)[v13 copy];
          [v9 setQueryItems:v16];

          double v17 = [v9 URL];
          if (!v17) {
            goto LABEL_12;
          }
          uint64_t v18 = v17;
          -[PKPassTileGroupView _openURL:](a1, v17);
        }
        else
        {
          uint64_t v19 = (void *)a1[67];
          if (!v19) {
            goto LABEL_13;
          }
          unint64_t v20 = [v19 secureElementPass];
          if (!v20) {
            goto LABEL_13;
          }
          id v9 = v20;
          id v21 = [v20 auxiliaryPassInformation];
          id v13 = v21;
          if (!v21 || ![v21 count]) {
            goto LABEL_12;
          }
          if (v7)
          {
            v27[0] = MEMORY[0x1E4F143A8];
            v27[1] = 3221225472;
            v27[2] = __73__PKPassTileGroupView__performDisplayAuxiliaryPassInformationItemAction___block_invoke;
            v27[3] = &unk_1E59CFE90;
            v27[4] = v7;
            uint64_t v22 = objc_msgSend(v13, "pk_firstObjectPassingTest:", v27);
          }
          else
          {
            uint64_t v22 = [v13 firstObject];
          }
          uint64_t v18 = v22;
          if (v22)
          {
            uint64_t v23 = [v22 items];
            v26[0] = MEMORY[0x1E4F143A8];
            v26[1] = 3221225472;
            v26[2] = __73__PKPassTileGroupView__performDisplayAuxiliaryPassInformationItemAction___block_invoke_2;
            v26[3] = &unk_1E59CFEB8;
            v26[4] = v8;
            uint64_t v24 = objc_msgSend(v23, "pk_firstObjectPassingTest:", v26);

            if (v24)
            {
              double v25 = [[PKDashboardAuxiliaryPassInformationViewController alloc] initWithItem:v24 forPass:v9];
              -[PKPassTileGroupView _displayViewController:](a1, v25);
            }
          }
        }

LABEL_12:
        goto LABEL_13;
      }
    }
  }
LABEL_14:
}

uint64_t __73__PKPassTileGroupView__performDisplayAuxiliaryPassInformationItemAction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  id v4 = *(void **)(a1 + 32);
  id v5 = v3;
  id v6 = v4;
  BOOL v7 = v6;
  if (v5 == v6)
  {
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
    if (v5 && v6) {
      uint64_t v8 = [v5 isEqualToString:v6];
    }
  }

  return v8;
}

uint64_t __73__PKPassTileGroupView__performDisplayAuxiliaryPassInformationItemAction___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  id v4 = *(void **)(a1 + 32);
  id v5 = v3;
  id v6 = v4;
  BOOL v7 = v6;
  if (v5 == v6)
  {
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
    if (v5 && v6) {
      uint64_t v8 = [v5 isEqualToString:v6];
    }
  }

  return v8;
}

- (void)_displayViewController:(void *)a1
{
  id v8 = a2;
  id v3 = objc_msgSend(a1, "pkui_viewControllerFromResponderChain");
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 navigationController];
    id v6 = v5;
    if (v5)
    {
      [v5 pushViewController:v8 animated:1];
    }
    else
    {
      BOOL v7 = [[PKNavigationController alloc] initWithRootViewController:v8];
      [v4 presentViewController:v7 animated:1 completion:0];
    }
  }
}

- (void)_performDisplayTileContextAction:(void *)a1
{
  if (a1)
  {
    id v3 = -[PKDashboardTileContextViewController initWithTileContext:forPass:passView:tileGroupID:overridesMaximumRows:]([PKDashboardTileContextViewController alloc], "initWithTileContext:forPass:passView:tileGroupID:overridesMaximumRows:", [a2 context], a1[67], a1[51], 0, 0);
    -[PKPassTileGroupView _displayViewController:](a1, v3);
  }
}

- (void)_performViewImageAction:(void *)a3 sourceImageView:
{
  if (a1)
  {
    id v5 = a3;
    id v7 = [a2 title];
    id v6 = objc_msgSend(a1, "pkui_viewControllerFromResponderChain");
    +[PKTileImagePreviewViewController presentWithImageView:v5 title:v7 presenting:v6];
  }
}

- (void)setPass:(id)a3 passView:(id)a4 groupTile:(id)a5 context:(id *)a6 animated:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v12 = (PKPass *)a3;
  id v51 = a4;
  id v13 = a5;
  CGFloat v14 = v13;
  if (a6->var0) {
    [v13 prearmTiles];
  }
  else {
  uint64_t v15 = [v13 tiles];
  }
  if (!v15)
  {
    uint64_t v15 = v12;
LABEL_8:

    uint64_t v12 = 0;
    uint64_t v15 = 0;
    goto LABEL_9;
  }
  if (!v12) {
    goto LABEL_8;
  }
LABEL_9:
  id v50 = v14;
  if (self->_pass != v12) {
    goto LABEL_12;
  }
  if (!PKEqualObjects()) {
    goto LABEL_12;
  }
  content = self->_content;
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __67__PKPassTileGroupView_setPass_passView_groupTile_context_animated___block_invoke;
  v52[3] = &unk_1E59CFEE0;
  id v53 = v51;
  uint64_t v54 = self;
  double v17 = [v15 differenceFromArray:content withOptions:0 usingEquivalenceTest:v52];
  int v18 = [v17 hasChanges];

  CGFloat v14 = v50;
  if (v18)
  {
LABEL_12:
    objc_storeStrong((id *)&self->_pass, v12);
    objc_storeStrong((id *)&self->_passView, a4);
    uint64_t v19 = [(PKPassView *)self->_passView passState];
    self->_lastPassStateHash = [v19 hash];

    objc_storeStrong((id *)&self->_groupTile, a5);
    p_content = &self->_content;
    objc_storeStrong((id *)&self->_content, v15);
    id v21 = [v14 metadata];
    uint64_t v22 = [v21 metadataTypeHorizontalFlowGroup];
    self->_columns = [v22 columns];

    uint64_t v23 = [v14 maximumRows];
    unint64_t v24 = [v23 unsignedIntegerValue];

    unint64_t var2 = a6->var2;
    if (!var2)
    {
      unint64_t var2 = a6->var1;
      if (v24)
      {
        if (v24 >= var2) {
          unint64_t var1 = a6->var1;
        }
        else {
          unint64_t var1 = v24;
        }
        if (var2) {
          unint64_t var2 = var1;
        }
        else {
          unint64_t var2 = v24;
        }
      }
      else if (!var2)
      {
        unint64_t var2 = -1;
      }
    }
    self->_unint64_t maximumRows = var2;
    uint64_t v27 = *p_content;
    if (*p_content) {
      double v28 = objc_msgSend(MEMORY[0x1E4F848D8], "createTileRowsForTiles:forceCompact:maximumRows:maximumColumns:", *p_content, 0);
    }
    else {
      double v28 = 0;
    }
    p_contentByRows = &self->_contentByRows;
    objc_storeStrong((id *)&self->_contentByRows, v28);
    if (v27) {

    }
    if (*p_content)
    {
      uint64_t v30 = [(NSArray *)*p_content firstObject];
      uint64_t v31 = [v30 metadata];
      self->_selectable = [v31 isSelectable];
    }
    else
    {
      self->_selectable = 0;
    }
    unint64_t v32 = [(NSArray *)*p_contentByRows count];
    unint64_t maximumRows = self->_maximumRows;
    if (v32 >= maximumRows) {
      unint64_t v34 = self->_maximumRows;
    }
    else {
      unint64_t v34 = v32;
    }
    if (v32 > maximumRows)
    {
      unint64_t v35 = v32;
      id v36 = [(PKPassTile *)self->_groupTile metadata];
      id v49 = [v36 metadataTypeHorizontalFlowGroup];

      uint64_t v37 = [v49 groupStyle];
      unint64_t v38 = 1;
      if (v37 != 1) {
        unint64_t v38 = 2;
      }
      self->_overflowType = v38;
      if ((unint64_t)[v49 columns] >= 2 && objc_msgSend(v49, "widthClass") == 1 && *p_content)
      {
        uint64_t v39 = [MEMORY[0x1E4F848D8] createTileRowsForTiles:*p_content forceCompact:1 maximumRows:self->_maximumRows maximumColumns:self->_columns];
        v40 = *p_contentByRows;
        *p_contentByRows = (NSArray *)v39;

        unint64_t v41 = [(NSArray *)*p_contentByRows count];
        unint64_t v35 = v41;
        if (v41 >= self->_maximumRows) {
          unint64_t v34 = self->_maximumRows;
        }
        else {
          unint64_t v34 = v41;
        }
      }
      -[NSArray subarrayWithRange:](*p_contentByRows, "subarrayWithRange:", 0, v34);
      id v42 = (NSArray *)objc_claimAutoreleasedReturnValue();
      effectiveContentByRows = self->_effectiveContentByRows;
      self->_effectiveContentByRows = v42;

      if (v35 != v34)
      {
        uint64_t v44 = -[NSArray subarrayWithRange:](*p_contentByRows, "subarrayWithRange:", v34, v35 - v34);
        id v45 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v55[0] = MEMORY[0x1E4F143A8];
        v55[1] = 3221225472;
        v55[2] = __FlattenContentRows_block_invoke;
        v55[3] = &unk_1E59CFF80;
        id v56 = v45;
        id v46 = v45;
        [v44 enumerateObjectsUsingBlock:v55];

        double v47 = (NSMutableArray *)[v46 mutableCopy];
        effectiveDroppedContent = self->_effectiveDroppedContent;
        self->_effectiveDroppedContent = v47;
      }
    }
    else
    {
      self->_overflowType = 0;
      objc_storeStrong((id *)&self->_effectiveContentByRows, *p_contentByRows);
      id v49 = self->_effectiveDroppedContent;
      self->_effectiveDroppedContent = 0;
    }
    CGFloat v14 = v50;

    self->_effectiveSelectable = self->_selectable;
    -[PKPassTileGroupView _updateSubviewsAnimated:](self, v7);
  }
}

uint64_t __67__PKPassTileGroupView_setPass_passView_groupTile_context_animated___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 416);
  id v6 = a2;
  id v7 = a3;
  id v8 = v4;
  if (PKEqualObjects())
  {
    id v9 = [v6 state];
    id v10 = [v7 state];
    id v11 = v9;
    if (v11 == v10)
    {
      id v13 = [v8 passState];
      if ([v13 hash] == v5)
      {
        uint64_t v12 = 1;
      }
      else
      {
        CGFloat v14 = [v11 stateTypeDefaultV2];
        uint64_t v15 = [v14 title];
        uint64_t v16 = [v15 valueTypeForeignReference];
        uint64_t v17 = [v16 foreignReferenceType];

        if (v17)
        {
          BOOL v18 = 1;
        }
        else
        {
          double v25 = [v14 body];
          uint64_t v19 = [v25 valueTypeForeignReference];
          uint64_t v20 = [v19 foreignReferenceType];

          if (v20)
          {
            BOOL v18 = 1;
          }
          else
          {
            id v21 = [v14 footer];
            uint64_t v22 = [v21 valueTypeForeignReference];
            uint64_t v24 = [v22 foreignReferenceType];

            BOOL v18 = v24 != 0;
          }
        }
        uint64_t v12 = !v18;
      }
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    [(PKPassTileGroupView *)self setNeedsLayout];
  }
}

- (void)_tileViewTapped:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 content];
  if (v5)
  {
    if ([v4 overflowType] == 2)
    {
      if (self)
      {
        id v6 = [PKDashboardTileContextViewController alloc];
        pass = self->_pass;
        passView = self->_passView;
        id v9 = [(PKPassTile *)self->_groupTile metadata];
        id v10 = [v9 identifier];
        id v11 = [(PKDashboardTileContextViewController *)v6 initWithTileContext:1 forPass:pass passView:passView tileGroupID:v10 overridesMaximumRows:1];

        uint64_t v12 = [(PKPassTile *)self->_groupTile state];
        id v13 = [v12 stateTypeGroup];
        CGFloat v14 = [v13 header];
        [(PKDashboardTileContextViewController *)v11 setTitle:v14];

        -[PKPassTileGroupView _displayViewController:](self, v11);
      }
    }
    else
    {
      uint64_t v15 = [v5 state];
      uint64_t v16 = (void *)MEMORY[0x1E4F84B58];
      uint64_t v17 = [v15 actions];
      BOOL v18 = [v16 effectiveActionForActions:v17];

      if (v18)
      {
        uint64_t v19 = [v5 metadata];
        if ([v5 supportsPaymentPassAction:v18])
        {
          switch([v18 type])
          {
            case 3:
              -[PKPassTileGroupView _performOpenExternalURLAction:](self, v18);
              break;
            case 4:
              id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
              if ([(PKPass *)self->_pass passType] == PKPassTypeSecureElement)
              {
                uint64_t v24 = self->_pass;
                if (v24 && WeakRetained)
                {
                  *(void *)buf = 0;
                  *(void *)&buf[8] = buf;
                  *(void *)&buf[16] = 0x2020000000;
                  char v44 = 0;
                  aBlock[0] = MEMORY[0x1E4F143A8];
                  aBlock[1] = 3221225472;
                  aBlock[2] = __39__PKPassTileGroupView__tileViewTapped___block_invoke;
                  aBlock[3] = &unk_1E59CFF08;
                  id v42 = buf;
                  id v32 = v4;
                  id v41 = v32;
                  double v25 = _Block_copy(aBlock);
                  id v26 = objc_alloc(MEMORY[0x1E4F84630]);
                  v38[0] = MEMORY[0x1E4F143A8];
                  v38[1] = 3221225472;
                  v38[2] = __39__PKPassTileGroupView__tileViewTapped___block_invoke_2;
                  v38[3] = &unk_1E59CAA98;
                  id v33 = v25;
                  id v39 = v33;
                  uint64_t v27 = (void *)[v26 initWithBlock:v38];
                  double v28 = PKLogFacilityTypeGetObject();
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)uint64_t v37 = 0;
                    _os_log_impl(&dword_19F450000, v28, OS_LOG_TYPE_DEFAULT, "PKPassTileGroupView: requesting SE action for PKPaymentPassActionTypeVehicleFunction.", v37, 2u);
                  }

                  v34[0] = MEMORY[0x1E4F143A8];
                  v34[1] = 3221225472;
                  v34[2] = __39__PKPassTileGroupView__tileViewTapped___block_invoke_110;
                  v34[3] = &unk_1E59CF408;
                  id v29 = v27;
                  id v35 = v29;
                  id v30 = v33;
                  id v36 = v30;
                  [WeakRetained passTileGroupView:self executeSEActionForPass:v24 tile:v5 withCompletion:v34];
                  if (!*(unsigned char *)(*(void *)&buf[8] + 24)) {
                    [v32 setInActionState:1 animated:1];
                  }

                  _Block_object_dispose(buf, 8);
                }
              }
              else
              {
                uint64_t v24 = 0;
              }

              break;
            case 7:
              -[PKPassTileGroupView _performDisplayAuxiliaryPassInformationItemAction:](self, v18);
              break;
            case 8:
              -[PKPassTileGroupView _performDisplayTileContextAction:](self, v18);
              break;
            case 9:
              uint64_t v31 = [v4 viewImageActionView];
              -[PKPassTileGroupView _performViewImageAction:sourceImageView:](self, v18, v31);

              break;
            default:
              break;
          }
        }
        else
        {
          uint64_t v20 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            id v21 = [v19 identifier];
            uint64_t v22 = [v5 stateIdentifier];
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v21;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v22;
            _os_log_impl(&dword_19F450000, v20, OS_LOG_TYPE_DEFAULT, "PKPassTileGroupView: ignoring tap on tile (%@: %@) due to unsupported action.", buf, 0x16u);
          }
        }
      }
    }
  }
}

uint64_t __39__PKPassTileGroupView__tileViewTapped___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return [*(id *)(a1 + 32) setInActionState:0 animated:1];
}

void __39__PKPassTileGroupView__tileViewTapped___block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__PKPassTileGroupView__tileViewTapped___block_invoke_3;
  block[3] = &unk_1E59CAA98;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __39__PKPassTileGroupView__tileViewTapped___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __39__PKPassTileGroupView__tileViewTapped___block_invoke_110(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (void)_tileViewPinched:(id)a3
{
  id v12 = a3;
  [v12 scale];
  id v4 = v12;
  if (v5 > 0.0)
  {
    id v6 = [v12 view];
    id v7 = [v6 content];
    id v8 = [v7 state];
    id v9 = (void *)MEMORY[0x1E4F84B58];
    id v10 = [v8 actions];
    id v11 = [v9 effectiveActionForActions:v10];

    if ([v11 type] == 9) {
      [(PKPassTileGroupView *)self _tileViewTapped:v6];
    }

    id v4 = v12;
  }
}

void __35__PKPassTileGroupView__contextMenu__block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    uint64_t v3 = [a1[4] type];
    if (v3 == 8)
    {
      -[PKPassTileGroupView _performDisplayTileContextAction:](a1[5], a1[4]);
    }
    else if (v3 == 7)
    {
      -[PKPassTileGroupView _performDisplayAuxiliaryPassInformationItemAction:](a1[5], a1[4]);
    }
    else
    {
      BOOL v4 = v3 == 3;
      id WeakRetained = v5;
      if (!v4) {
        goto LABEL_10;
      }
      -[PKPassTileGroupView _performOpenExternalURLAction:](a1[5], a1[4]);
    }
    id WeakRetained = v5;
  }
LABEL_10:
}

- (PKPass)pass
{
  return self->_pass;
}

- (UIEdgeInsets)contentInset
{
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double bottom = self->_contentInset.bottom;
  double right = self->_contentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (PKPassTileGroupViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPassTileGroupViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_itemViewsByRows, 0);
  objc_storeStrong((id *)&self->_effectiveDroppedContent, 0);
  objc_storeStrong((id *)&self->_effectiveContentByRows, 0);
  objc_storeStrong((id *)&self->_contentByRows, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_groupTile, 0);

  objc_storeStrong((id *)&self->_passView, 0);
}

@end