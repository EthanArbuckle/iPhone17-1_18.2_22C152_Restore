@interface SKUIHorizontalListView
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)_sizeForViewElement:(id)a3 width:(double)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (double)_elementSpacingForViewElement:(id)a3;
+ (double)_lineSpacingForLineElements:(id)a3;
+ (double)_lineSpacingForViewElement:(id)a3;
+ (id)_attributedStringForButton:(id)a3 context:(id)a4;
+ (id)_attributedStringForButtonText:(id)a3 type:(int64_t)a4 style:(id)a5 context:(id)a6;
+ (id)_attributedStringForLabel:(id)a3 context:(id)a4;
+ (id)_attributedStringForMenuItem:(id)a3 context:(id)a4;
+ (id)_linesWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (CGRect)hitRect;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SKUIHorizontalListView)initWithFrame:(CGRect)a3;
- (id)_viewElementForView:(id)a3;
- (id)viewForElementIdentifier:(id)a3;
- (void)_buttonAction:(id)a3;
- (void)_destroyMenuPopover;
- (void)_imageTapAction:(id)a3;
- (void)_menuButtonAction:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)menuPopover:(id)a3 didSelectMenuItemAtIndex:(int64_t)a4;
- (void)menuPopover:(id)a3 willRepositionToRect:(CGRect *)a4 inView:(id *)a5;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (void)setContentInset:(UIEdgeInsets)a3;
@end

@implementation SKUIHorizontalListView

- (SKUIHorizontalListView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v8) {
        -[SKUIHorizontalListView initWithFrame:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)SKUIHorizontalListView;
  v16 = -[SKUIViewReuseView initWithFrame:](&v18, sel_initWithFrame_, x, y, width, height);
  if (v16) {
    [(SKUIViewReuseView *)v16 registerClass:objc_opt_class() forViewWithReuseIdentifier:@"vlockup"];
  }
  return v16;
}

- (void)dealloc
{
  [(SKUIMenuPopoverController *)self->_popoverController setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SKUIHorizontalListView;
  [(SKUIViewReuseView *)&v3 dealloc];
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v9) {
        +[SKUIHorizontalListView prefetchResourcesForViewElement:reason:context:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __73__SKUIHorizontalListView_prefetchResourcesForViewElement_reason_context___block_invoke;
  v20[3] = &unk_1E64234D0;
  id v17 = v8;
  v22 = &v24;
  int64_t v23 = a4;
  id v21 = v17;
  [v7 enumerateChildrenUsingBlock:v20];
  char v18 = *((unsigned char *)v25 + 24);

  _Block_object_dispose(&v24, 8);
  return v18;
}

uint64_t __73__SKUIHorizontalListView_prefetchResourcesForViewElement_reason_context___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) prefetchResourcesForViewElement:a2 reason:*(void *)(a1 + 48)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v4 + 24)) {
    char v5 = 1;
  }
  else {
    char v5 = result;
  }
  *(unsigned char *)(v4 + 24) = v5;
  return result;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    +[SKUIHorizontalListView preferredSizeForViewElement:context:]();
  }
  uint64_t v29 = 0;
  v30 = (double *)&v29;
  uint64_t v31 = 0x3010000000;
  v32 = &unk_1C1D0F257;
  long long v33 = *MEMORY[0x1E4F1DB30];
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __62__SKUIHorizontalListView_preferredSizeForViewElement_context___block_invoke;
  v21[3] = &unk_1E6426030;
  id v7 = v6;
  id v22 = v7;
  int64_t v23 = &v29;
  uint64_t v24 = &v25;
  [v5 enumerateChildrenUsingBlock:v21];
  id v8 = [v5 style];
  [v8 elementPadding];
  double v10 = v9;
  double v12 = v11;

  uint64_t v13 = v30;
  double v14 = v10 + v12 + v30[5];
  v30[5] = v14;
  uint64_t v15 = v26[3];
  BOOL v16 = v15 <= 1;
  uint64_t v17 = v15 - 1;
  if (v16)
  {
    double v18 = v13[4];
  }
  else
  {
    double v18 = v13[4] + (float)((float)v17 * 5.0);
    v13[4] = v18;
  }

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  double v19 = v18;
  double v20 = v14;
  result.double height = v20;
  result.double width = v19;
  return result;
}

void __62__SKUIHorizontalListView_preferredSizeForViewElement_context___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v20 = a2;
  uint64_t v5 = [v20 elementType];
  if (v5 == 152)
  {
    double v12 = *(void **)(a1 + 32);
    uint64_t v13 = [v20 thumbnailImage];
    [v12 sizeForImageElement:v13];
    double v15 = v14;
    double v17 = v16;

    id v8 = v20;
    uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
    double v19 = *(double *)(v18 + 40);
    if (v19 < v17) {
      double v19 = v17;
    }
    *(double *)(v18 + 40) = v19;
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    double v11 = v15 + *(double *)(v10 + 32);
    goto LABEL_9;
  }
  if (v5 == 49)
  {
    [*(id *)(a1 + 32) sizeForImageElement:v20];
    id v8 = v20;
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    if (*(double *)(v9 + 40) >= v7) {
      double v7 = *(double *)(v9 + 40);
    }
    *(double *)(v9 + 40) = v7;
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    double v11 = v6 + *(double *)(v10 + 32);
LABEL_9:
    *(double *)(v10 + 32) = v11;
    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    goto LABEL_11;
  }
  *(_OWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = *MEMORY[0x1E4F1DB30];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  *a3 = 1;
  id v8 = v20;
LABEL_11:
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v10) {
        +[SKUIHorizontalListView requestLayoutForViewElement:width:context:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  uint64_t v18 = [v8 labelLayoutCache];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __68__SKUIHorizontalListView_requestLayoutForViewElement_width_context___block_invoke;
  v21[3] = &unk_1E6424DE8;
  double v24 = a4;
  id v25 = a1;
  id v22 = v18;
  id v23 = v8;
  id v19 = v8;
  id v20 = v18;
  [v9 enumerateChildrenUsingBlock:v21];
}

uint64_t __68__SKUIHorizontalListView_requestLayoutForViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  uint64_t v3 = [v10 elementType];
  if (v3 > 68)
  {
    id v4 = v10;
    switch(v3)
    {
      case 135:
        double v6 = SKUIStarRatingControlView;
        goto LABEL_15;
      case 136:
      case 137:
      case 139:
      case 140:
      case 142:
      case 143:
        goto LABEL_18;
      case 138:
        double v7 = [*(id *)(a1 + 56) _attributedStringForLabel:v10 context:*(void *)(a1 + 40)];
        [*(id *)(a1 + 32) requestLayoutForLabel:v10 attributedString:v7 width:(uint64_t)*(double *)(a1 + 48)];
        goto LABEL_13;
      case 141:
        goto LABEL_8;
      case 144:
        double v6 = SKUITomatoRatingView;
LABEL_15:
        double v5 = *(double *)(a1 + 48);
        goto LABEL_16;
      default:
        id v4 = v10;
        if (v3 != 69) {
          goto LABEL_18;
        }
        double v7 = [v10 titleItem];
        id v8 = [*(id *)(a1 + 56) _attributedStringForMenuItem:v7 context:*(void *)(a1 + 40)];
        [*(id *)(a1 + 32) requestLayoutForViewElement:v7 attributedString:v8 width:(uint64_t)*(double *)(a1 + 48)];

        break;
    }
    goto LABEL_13;
  }
  if (v3 == 8)
  {
    uint64_t v3 = [*(id *)(a1 + 32) requestLayoutForBadge:v10 width:(uint64_t)*(double *)(a1 + 48)];
    goto LABEL_17;
  }
  id v4 = v10;
  if (v3 == 12)
  {
LABEL_8:
    double v7 = [*(id *)(a1 + 56) _attributedStringForButton:v10 context:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) requestLayoutForButton:v10 attributedString:v7 width:(uint64_t)*(double *)(a1 + 48)];
LABEL_13:

    goto LABEL_17;
  }
  if (v3 != 66) {
    goto LABEL_18;
  }
  [*(id *)(a1 + 56) _sizeForViewElement:v10 width:*(void *)(a1 + 40) context:*(double *)(a1 + 48)];
  double v6 = SKUIVerticalLockupView;
LABEL_16:
  uint64_t v3 = [(__objc2_class *)v6 requestLayoutForViewElement:v10 width:*(void *)(a1 + 40) context:v5];
LABEL_17:
  id v4 = v10;
LABEL_18:

  return MEMORY[0x1F41817F8](v3, v4);
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v10) {
        +[SKUIHorizontalListView sizeThatFitsWidth:viewElement:context:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  uint64_t v57 = 0;
  v58 = (double *)&v57;
  uint64_t v59 = 0x3010000000;
  v60 = &unk_1C1D0F257;
  long long v61 = *MEMORY[0x1E4F1DB30];
  uint64_t v53 = 0;
  v54 = (double *)&v53;
  uint64_t v55 = 0x2020000000;
  uint64_t v56 = 0;
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x2020000000;
  uint64_t v52 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x2020000000;
  char v48 = 0;
  uint64_t v18 = [a1 _linesWithViewElement:v8 width:v9 context:a3];
  uint64_t v19 = [v18 count];
  uint64_t v33 = MEMORY[0x1E4F143A8];
  uint64_t v34 = 3221225472;
  v35 = __64__SKUIHorizontalListView_sizeThatFitsWidth_viewElement_context___block_invoke;
  v36 = &unk_1E6426058;
  v38 = &v45;
  id v42 = a1;
  double v43 = a3;
  id v20 = v9;
  id v37 = v20;
  v39 = &v53;
  v40 = &v57;
  v41 = &v49;
  uint64_t v44 = v19;
  [v18 enumerateObjectsUsingBlock:&v33];
  if (v50[3] != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v21 = objc_msgSend(v18, "objectAtIndex:", v33, v34, v35, v36);
    uint64_t v22 = [v21 count];

    if (v22 >= 2) {
      v58[4] = v58[4] + (double)(v22 - 1) * v54[3];
    }
  }
  if (*((unsigned char *)v46 + 24) && v58[4] < a3) {
    v58[4] = a3;
  }
  id v23 = objc_msgSend(v8, "style", v33, v34, v35, v36);
  [v23 elementPadding];
  double v25 = v24;
  double v27 = v26;

  double v28 = v25 + v27;
  double v29 = v58[4];
  double v30 = v28 + v58[5];
  v58[5] = v30;

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v57, 8);

  double v31 = v29;
  double v32 = v30;
  result.double height = v32;
  result.double width = v31;
  return result;
}

void __64__SKUIHorizontalListView_sizeThatFitsWidth_viewElement_context___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    double v9 = 0.0;
    double v10 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ([v12 elementType] == 127)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
        }
        else
        {
          [*(id *)(a1 + 72) _sizeForViewElement:v12 width:*(void *)(a1 + 32) context:*(double *)(a1 + 80)];
          double v14 = v13;
          double v16 = v15;
          double v17 = *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
          [*(id *)(a1 + 72) _elementSpacingForViewElement:v12];
          if (v17 >= v18) {
            double v18 = v17;
          }
          *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v18;
          if (v10 < v16) {
            double v10 = v16;
          }
          double v9 = v9 + v14;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v7);
  }
  else
  {
    double v9 = 0.0;
    double v10 = 0.0;
  }
  uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8);
  if (v9 > *(double *)(v19 + 32))
  {
    *(double *)(v19 + 32) = v9;
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = a3;
  }
  if (*(void *)(a1 + 88) - 1 > a3)
  {
    [*(id *)(a1 + 72) _lineSpacingForLineElements:v5];
    *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = v20
                                                                + *(double *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                            + 40);
  }
  *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = v10
                                                              + *(double *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                          + 40);
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  uint64_t v8 = (SKUIListViewElement *)a3;
  id v9 = a5;
  [(NSMapTable *)self->_imageViewToImageResourceCacheKey removeAllObjects];
  [(NSMutableArray *)self->_artworkRequestPassthroughViews removeAllObjects];
  self->_elementSpacing = 0.0;
  double v10 = [(id)objc_opt_class() _linesWithViewElement:v8 width:v9 context:a4];
  lines = self->_lines;
  self->_lines = v10;

  listElement = self->_listElement;
  self->_listElement = v8;
  double v13 = v8;

  self->_useBigHitTarget = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __62__SKUIHorizontalListView_reloadWithViewElement_width_context___block_invoke;
  v22[3] = &unk_1E6426080;
  double v24 = a4;
  v22[4] = self;
  id v23 = v9;
  id v14 = v9;
  [(SKUIViewReuseView *)self modifyUsingBlock:v22];
  p_bigHitInsets = &self->_bigHitInsets;
  if (self->_useBigHitTarget)
  {
    __asm { FMOV            V0.2D, #-15.0 }
    *(_OWORD *)&p_bigHitInsets->top = _Q0;
    *(_OWORD *)&self->_bigHitInsets.bottom = _Q0;
  }
  else
  {
    long long v21 = *(_OWORD *)(MEMORY[0x1E4FB2848] + 16);
    *(_OWORD *)&p_bigHitInsets->top = *MEMORY[0x1E4FB2848];
    *(_OWORD *)&self->_bigHitInsets.bottom = v21;
  }
}

void __62__SKUIHorizontalListView_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = *(id *)(*(void *)(a1 + 32) + 520);
  uint64_t v43 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
  if (v43)
  {
    uint64_t v42 = *(void *)v51;
    double v4 = *MEMORY[0x1E4FB2848];
    double v5 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v6 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v7 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v51 != v42) {
          objc_enumerationMutation(obj);
        }
        uint64_t v44 = v8;
        id v9 = *(void **)(*((void *)&v50 + 1) + 8 * v8);
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        id v45 = v9;
        uint64_t v10 = [v45 countByEnumeratingWithState:&v46 objects:v54 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v47;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v47 != v12) {
                objc_enumerationMutation(v45);
              }
              id v14 = *(void **)(*((void *)&v46 + 1) + 8 * i);
              uint64_t v15 = [v14 elementType];
              id v16 = 0;
              if (v15 > 68)
              {
                id v17 = 0;
                switch(v15)
                {
                  case 135:
                    id v19 = v14;
                    uint64_t v20 = [v19 starType];
                    double v21 = *(double *)(a1 + 48);
                    uint64_t v22 = *(void *)(a1 + 40);
                    if (v20 == 2) {
                      [v3 addStarRatingControlViewWithViewElement:v19 width:v22 context:v21];
                    }
                    else {
                    id v17 = [v3 addStarRatingViewWithViewElement:v19 width:v22 context:v21];
                    }
                    goto LABEL_48;
                  case 136:
                  case 137:
                  case 139:
                  case 140:
                  case 142:
                  case 143:
                    goto LABEL_57;
                  case 138:
                    uint64_t v34 = [v3 addLabelViewWithElement:v14 width:*(void *)(a1 + 40) context:*(double *)(a1 + 48)];
                    goto LABEL_44;
                  case 141:
                    goto LABEL_23;
                  case 144:
                    uint64_t v34 = [v3 addTomatoRatingViewWithViewElement:v14 width:*(void *)(a1 + 40) context:*(double *)(a1 + 48)];
LABEL_44:
                    id v17 = (id)v34;
                    goto LABEL_49;
                  default:
                    if (v15 == 69)
                    {
                      id v19 = [v14 titleItem];
                      id v17 = [v3 addMenuButtonWithTitleItem:v19 width:*(void *)(a1 + 40) context:*(double *)(a1 + 48)];
                      [v17 addTarget:*(void *)(a1 + 32) action:sel__menuButtonAction_ forControlEvents:64];
LABEL_48:

LABEL_49:
                      id v16 = 0;
                      goto LABEL_50;
                    }
                    id v17 = 0;
                    if (v15 != 152) {
                      goto LABEL_57;
                    }
                    double v25 = [v3 addImageViewWithVideoElement:v14 context:*(void *)(a1 + 40)];
                    break;
                }
LABEL_34:
                id v26 = v25;
LABEL_36:
                id v16 = v26;
                id v17 = v26;
                if (!v26) {
                  goto LABEL_50;
                }
LABEL_37:
                double v29 = [*(id *)(a1 + 40) imageResourceCacheKeyForViewElement:v14];
                if (v29)
                {
                  double v30 = *(void **)(*(void *)(a1 + 32) + 512);
                  if (!v30)
                  {
                    uint64_t v31 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:517 valueOptions:0 capacity:1];
                    uint64_t v32 = *(void *)(a1 + 32);
                    uint64_t v33 = *(void **)(v32 + 512);
                    *(void *)(v32 + 512) = v31;

                    double v30 = *(void **)(*(void *)(a1 + 32) + 512);
                  }
                  [v30 setObject:v29 forKey:v16];
                }

                goto LABEL_50;
              }
              if (v15 <= 48)
              {
                if (v15 == 8)
                {
                  double v25 = [v3 addBadgeViewWithElement:v14 width:*(void *)(a1 + 40) context:*(double *)(a1 + 48)];
                  goto LABEL_34;
                }
                id v17 = 0;
                if (v15 != 12) {
                  goto LABEL_57;
                }
              }
              else
              {
                if (v15 == 49)
                {
                  double v27 = [v3 addImageViewWithElement:v14 context:*(void *)(a1 + 40)];
                  double v28 = [v27 tapRecognizer];
                  [v28 addTarget:*(void *)(a1 + 32) action:sel__imageTapAction_];

                  id v26 = v27;
                  goto LABEL_36;
                }
                if (v15 != 50)
                {
                  id v17 = 0;
                  if (v15 != 66) {
                    goto LABEL_57;
                  }
                  id v17 = [v3 addReusableViewWithReuseIdentifier:@"vlockup"];
                  objc_msgSend(v17, "setContentInset:", v4, v5, v6, v7);
                  int v18 = 1;
                  [v17 setSizingStyle:1];
                  [(id)objc_opt_class() _sizeForViewElement:v14 width:*(void *)(a1 + 40) context:*(double *)(a1 + 48)];
                  objc_msgSend(v17, "reloadWithViewElement:width:context:", v14, *(void *)(a1 + 40));
                  id v16 = 0;
                  if (!v17) {
                    goto LABEL_57;
                  }
                  goto LABEL_51;
                }
              }
LABEL_23:
              id v23 = v14;
              if ([v23 isBigHitButton]) {
                *(unsigned char *)(*(void *)(a1 + 32) + 544) = 1;
              }
              double v24 = [v3 addButtonWithElement:v23 width:*(void *)(a1 + 40) context:*(double *)(a1 + 48)];
              [v24 addTarget:*(void *)(a1 + 32) action:sel__buttonAction_ forControlEvents:64];
              id v17 = v24;
              if ([v23 elementType] == 50) {
                id v16 = v17;
              }
              else {
                id v16 = 0;
              }

              if (v16) {
                goto LABEL_37;
              }
LABEL_50:
              int v18 = 0;
              if (!v17) {
                goto LABEL_57;
              }
LABEL_51:
              double v35 = *(double *)(*(void *)(a1 + 32) + 496);
              [(id)objc_opt_class() _elementSpacingForViewElement:v14];
              if (v35 >= v36) {
                double v36 = v35;
              }
              *(double *)(*(void *)(a1 + 32) + 496) = v36;
              if (v18)
              {
                id v37 = *(void **)(*(void *)(a1 + 32) + 424);
                if (!v37)
                {
                  uint64_t v38 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
                  uint64_t v39 = *(void *)(a1 + 32);
                  v40 = *(void **)(v39 + 424);
                  *(void *)(v39 + 424) = v38;

                  id v37 = *(void **)(*(void *)(a1 + 32) + 424);
                }
                [v37 addObject:v17];
              }
LABEL_57:
            }
            uint64_t v11 = [v45 countByEnumeratingWithState:&v46 objects:v54 count:16];
          }
          while (v11);
        }

        uint64_t v8 = v44 + 1;
      }
      while (v44 + 1 != v43);
      uint64_t v43 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
    }
    while (v43);
  }
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    [(SKUIHorizontalListView *)self setNeedsLayout];
  }
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  id v8 = a4;
  id v9 = a5;
  id v28 = v8;
  uint64_t v31 = [v8 requestIdentifier];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = self->_imageViewToImageResourceCacheKey;
  uint64_t v10 = [(NSMapTable *)obj countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    int v12 = 0;
    uint64_t v13 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v37 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v16 = [(NSMapTable *)self->_imageViewToImageResourceCacheKey objectForKey:v15];
        id v17 = [v9 requestIdentifierForResourceCacheKey:v16];
        int v18 = v17;
        if (v17 && [v17 unsignedIntegerValue] == v31)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v19 = [v15 imageView];
            [v19 setImage:v29];
          }
          else
          {
            [v15 setImage:v29];
          }
          int v12 = 1;
        }
      }
      uint64_t v11 = [(NSMapTable *)obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v11);
  }
  else
  {
    int v12 = 0;
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v20 = self->_artworkRequestPassthroughViews;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v33;
    double v25 = v28;
    double v24 = v29;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v33 != v23) {
          objc_enumerationMutation(v20);
        }
        v12 |= [*(id *)(*((void *)&v32 + 1) + 8 * j) setImage:v29 forArtworkRequest:v28 context:v9];
      }
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v22);
  }
  else
  {
    double v25 = v28;
    double v24 = v29;
  }

  return v12 & 1;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  id v4 = a3;
  double v5 = [(SKUIViewElement *)self->_listElement flattenedChildren];
  double v6 = [(SKUIViewReuseView *)self allExistingViews];
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  int v18 = __Block_byref_object_copy__30;
  id v19 = __Block_byref_object_dispose__30;
  id v20 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__SKUIHorizontalListView_viewForElementIdentifier___block_invoke;
  v11[3] = &unk_1E64251F0;
  id v7 = v4;
  id v12 = v7;
  id v8 = v6;
  id v13 = v8;
  id v14 = &v15;
  [v5 enumerateObjectsUsingBlock:v11];
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v9;
}

void __51__SKUIHorizontalListView_viewForElementIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v21 = a2;
  id v7 = [v21 itmlID];
  id v8 = v21;
  if (v7)
  {
    id v9 = [v21 itmlID];
    if ([v9 isEqual:*(void *)(a1 + 32)])
    {
    }
    else
    {
      uint64_t v10 = [v21 elementID];
      int v11 = [v10 isEqual:*(void *)(a1 + 32)];

      id v8 = v21;
      if (!v11) {
        goto LABEL_13;
      }
    }
    id v12 = [*(id *)(a1 + 40) objectAtIndex:a3];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = v12;
      id v14 = [v13 imageView];

      if (v14)
      {
        uint64_t v15 = [v13 imageView];
        uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
        uint64_t v17 = *(void **)(v16 + 40);
        *(void *)(v16 + 40) = v15;
      }
    }
    uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v20 = *(void *)(v18 + 40);
    id v19 = (id *)(v18 + 40);
    if (v20 || (objc_storeStrong(v19, v12), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))) {
      *a4 = 1;
    }

    id v8 = v21;
  }
LABEL_13:
}

- (CGRect)hitRect
{
  if (self->_useBigHitTarget)
  {
    v14.receiver = self;
    v14.super_class = (Class)SKUIHorizontalListView;
    [(SKUIHorizontalListView *)&v14 hitRect];
    double top = self->_bigHitInsets.top;
    double left = self->_bigHitInsets.left;
    double v6 = v5 + left;
    double v8 = v7 + top;
    double v10 = v9 - (left + self->_bigHitInsets.right);
    double v12 = v11 - (top + self->_bigHitInsets.bottom);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SKUIHorizontalListView;
    [(SKUIHorizontalListView *)&v13 hitRect];
  }
  result.size.double height = v12;
  result.size.double width = v10;
  result.origin.double y = v8;
  result.origin.double x = v6;
  return result;
}

- (void)layoutSubviews
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  v84.receiver = self;
  v84.super_class = (Class)SKUIHorizontalListView;
  [(SKUIHorizontalListView *)&v84 layoutSubviews];
  id v3 = [(SKUIViewReuseView *)self allExistingViews];
  id v4 = [(SKUIListViewElement *)self->_listElement style];
  uint64_t v62 = [v4 elementAlignment];

  [(SKUIHorizontalListView *)self bounds];
  CGFloat v69 = v6;
  CGFloat v70 = v5;
  double v71 = v7;
  CGFloat v68 = v8;
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id obj = self->_lines;
  uint64_t v63 = [(NSArray *)obj countByEnumeratingWithState:&v80 objects:v87 count:16];
  if (v63)
  {
    uint64_t v11 = 0;
    uint64_t v61 = *(void *)v81;
    uint64_t v12 = *MEMORY[0x1E4F1DB28];
    uint64_t v13 = *(void *)(MEMORY[0x1E4F1DB28] + 8);
    double v66 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
    double v67 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
    uint64_t v59 = v13;
    uint64_t v60 = *MEMORY[0x1E4F1DB28];
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v81 != v61) {
          objc_enumerationMutation(obj);
        }
        uint64_t v65 = v14;
        uint64_t v15 = *(void **)(*((void *)&v80 + 1) + 8 * v14);
        uint64_t v64 = [v15 count];
        long long v76 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        id v16 = v15;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v76 objects:v86 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = 0;
          uint64_t v20 = *(void *)v77;
          double v21 = 0.0;
          double v22 = 0.0;
          uint64_t v23 = v11;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v77 != v20) {
                objc_enumerationMutation(v16);
              }
              if ([*(id *)(*((void *)&v76 + 1) + 8 * i) elementType] == 127)
              {
                ++v19;
              }
              else
              {
                double v25 = [v3 objectAtIndex:v23];
                objc_msgSend(v25, "sizeThatFits:", v67, v66);
                double v27 = v26;
                uint64_t v29 = v28;
                [(SKUIHorizontalListView *)self bounds];
                if (v27 < v30) {
                  double v30 = v27;
                }
                uint64_t v31 = v12;
                uint64_t v32 = v13;
                uint64_t v33 = v29;
                CGRect v89 = CGRectIntegral(*(CGRect *)(&v30 - 2));
                double width = v89.size.width;
                double height = v89.size.height;
                objc_msgSend(v25, "setFrame:", v89.origin.x, v89.origin.y);
                if (v22 < height) {
                  double v22 = height;
                }
                double v21 = v21 + width;
                ++v23;
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v76 objects:v86 count:16];
          }
          while (v18);
        }
        else
        {
          uint64_t v19 = 0;
          double v21 = 0.0;
          double v22 = 0.0;
        }

        if (v64 > 1) {
          double v21 = v21 + self->_elementSpacing * (double)(v64 - 1);
        }
        if (v19 < 1)
        {
          double v39 = 0.0;
        }
        else
        {
          [(SKUIHorizontalListView *)self bounds];
          CGFloat v36 = CGRectGetWidth(v90) - self->_contentInset.left - self->_contentInset.right - v21;
          BOOL v37 = v36 <= 0.0;
          double v38 = v36 / (double)v19;
          if (v37) {
            double v39 = 0.0;
          }
          else {
            double v39 = v38;
          }
        }
        if (v62 == 3)
        {
          double left = v71 - v21 - self->_contentInset.right;
        }
        else if (v62 == 2)
        {
          float v40 = (v71 - v21) * 0.5;
          double left = floorf(v40);
        }
        long long v74 = 0u;
        long long v75 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        id v41 = v16;
        uint64_t v42 = [v41 countByEnumeratingWithState:&v72 objects:v85 count:16];
        if (v42)
        {
          uint64_t v43 = v42;
          uint64_t v44 = *(void *)v73;
          do
          {
            for (uint64_t j = 0; j != v43; ++j)
            {
              if (*(void *)v73 != v44) {
                objc_enumerationMutation(v41);
              }
              long long v46 = *(void **)(*((void *)&v72 + 1) + 8 * j);
              if ([v46 elementType] == 127)
              {
                double MaxX = v39 + left;
              }
              else
              {
                long long v48 = [v3 objectAtIndex:v11];
                [v48 frame];
                CGFloat v50 = v49;
                double v52 = v51;
                long long v53 = [v46 style];
                unint64_t v54 = [v53 elementPosition];

                double v55 = top;
                if (v54 <= 9)
                {
                  if (((1 << v54) & 0x33) != 0)
                  {
                    float v56 = top + (v22 - v52) * 0.5;
                    double v55 = roundf(v56);
                  }
                  else
                  {
                    double v55 = top;
                    if (((1 << v54) & 0x308) != 0) {
                      double v55 = top + v22 - v52;
                    }
                  }
                }
                SKUIRectByApplyingUserInterfaceLayoutDirectionInRect(left, v55, v50, v52, v70, v69, v71, v68);
                objc_msgSend(v48, "setFrame:");
                v91.origin.double x = left;
                v91.origin.double y = v55;
                v91.size.double width = v50;
                v91.size.double height = v52;
                double MaxX = CGRectGetMaxX(v91);
                ++v11;
              }
              double left = MaxX + self->_elementSpacing;
            }
            uint64_t v43 = [v41 countByEnumeratingWithState:&v72 objects:v85 count:16];
          }
          while (v43);
        }

        double left = self->_contentInset.left;
        [(id)objc_opt_class() _lineSpacingForLineElements:v41];
        double top = top + v22 + v57;
        uint64_t v14 = v65 + 1;
        uint64_t v13 = v59;
        uint64_t v12 = v60;
      }
      while (v65 + 1 != v63);
      uint64_t v63 = [(NSArray *)obj countByEnumeratingWithState:&v80 objects:v87 count:16];
    }
    while (v63);
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  if (self->_useBigHitTarget)
  {
    [(SKUIHorizontalListView *)self hitRect];
    CGFloat v10 = x;
    CGFloat v11 = y;
    return CGRectContainsPoint(*(CGRect *)&v6, *(CGPoint *)&v10);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SKUIHorizontalListView;
    return -[SKUIHorizontalListView pointInside:withEvent:](&v13, sel_pointInside_withEvent_, a4, a3.x, a3.y);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  double v5 = objc_opt_class();
  uint64_t v6 = [(SKUIViewReuseView *)self allExistingViews];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  float v40 = self;
  id obj = self->_lines;
  uint64_t v43 = [(NSArray *)obj countByEnumeratingWithState:&v52 objects:v57 count:16];
  char v7 = 0;
  uint64_t v8 = 0;
  if (v43)
  {
    uint64_t v9 = 0;
    uint64_t v42 = *(void *)v53;
    double v10 = 0.0;
    double v11 = 0.0;
    double v12 = 0.0;
    double v13 = 0.0;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v53 != v42) {
          objc_enumerationMutation(obj);
        }
        double v45 = v11;
        uint64_t v46 = v8;
        double v47 = v13;
        uint64_t v44 = v14;
        uint64_t v15 = *(void **)(*((void *)&v52 + 1) + 8 * v14);
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        id v16 = v15;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v48 objects:v56 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v49;
          double v20 = 0.0;
          double v21 = 0.0;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v49 != v19) {
                objc_enumerationMutation(v16);
              }
              uint64_t v23 = *(void **)(*((void *)&v48 + 1) + 8 * i);
              if (objc_msgSend(v23, "elementType", v40) == 127)
              {
                char v7 = 1;
              }
              else
              {
                double v24 = [v6 objectAtIndex:v9];
                objc_msgSend(v24, "sizeThatFits:", width, 1.79769313e308);
                double v26 = v25;
                double v28 = v27;
                [v5 _elementSpacingForViewElement:v23];
                if (v12 < v29) {
                  double v12 = v29;
                }
                if (v21 < v28) {
                  double v21 = v28;
                }
                double v20 = v20 + v26;
                ++v9;
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v48 objects:v56 count:16];
          }
          while (v18);
        }
        else
        {
          double v20 = 0.0;
          double v21 = 0.0;
        }

        double v13 = v47 + v45 + v21;
        [v5 _lineSpacingForLineElements:v16];
        double v11 = v30;
        uint64_t v31 = [v16 count];
        uint64_t v8 = v46;
        if (v31 > v46)
        {
          double v10 = v20;
          uint64_t v8 = v31;
        }
        uint64_t v14 = v44 + 1;
      }
      while (v44 + 1 != v43);
      uint64_t v43 = [(NSArray *)obj countByEnumeratingWithState:&v52 objects:v57 count:16];
    }
    while (v43);
  }
  else
  {
    double v10 = 0.0;
    double v12 = 0.0;
    double v13 = 0.0;
  }

  double v32 = v10 + (double)(v8 - 1) * v12;
  if (v8 <= 1) {
    double v32 = v10;
  }
  if ((v7 & (v32 < width)) != 0) {
    double v32 = width;
  }
  if (width >= v32) {
    double width = v32;
  }
  uint64_t v33 = [(SKUIListViewElement *)v40->_listElement style];
  [v33 elementPadding];
  double v35 = v34;
  double v37 = v36;

  double v38 = v13 + v35 + v37;
  double v39 = width;
  result.double height = v38;
  result.double width = v39;
  return result;
}

- (void)menuPopover:(id)a3 didSelectMenuItemAtIndex:(int64_t)a4
{
  if (self->_focusedMenuButton)
  {
    -[SKUIHorizontalListView _viewElementForView:](self, "_viewElementForView:");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [v6 dispatchEventOfType:2 forItemAtIndex:a4];
    [(SKUIHorizontalListView *)self _destroyMenuPopover];
  }
}

- (void)menuPopover:(id)a3 willRepositionToRect:(CGRect *)a4 inView:(id *)a5
{
  [(UIControl *)self->_focusedMenuButton frame];
  a4->origin.CGFloat x = v6;
  a4->origin.CGFloat y = v7;
  a4->size.double width = v8;
  a4->size.double height = v9;
}

- (void)_buttonAction:(id)a3
{
  v23[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(SKUIViewElement *)self->_listElement flattenedChildren];
  CGFloat v6 = [(SKUIViewReuseView *)self allExistingViews];
  unint64_t v7 = [v6 indexOfObjectIdenticalTo:v4];

  if (v7 < [v5 count])
  {
    CGFloat v8 = [v5 objectAtIndex:v7];
    if (SKUIIKViewElementTypeIsButton([v8 elementType]))
    {
      CGFloat v9 = SKUICollectionViewCellForView(self);
      double v10 = SKUICollectionViewForView(v9);
      double v11 = [v10 delegate];
      if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        double v20 = [v10 indexPathForCell:v9];
        [v11 collectionView:v10 didConfirmButtonElement:v8 withClickInfo:0 forItemAtIndexPath:v20];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          double v21 = v9;
          id v12 = v4;
          double v13 = (void *)MEMORY[0x1E4F1CA60];
          v22[0] = @"toggled";
          uint64_t v14 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v12, "isToggled"));
          v23[0] = v14;
          v23[1] = v8;
          v22[1] = @"target";
          v22[2] = @"count";
          uint64_t v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "count"));
          v23[2] = v15;
          id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:3];
          uint64_t v17 = [v13 dictionaryWithDictionary:v16];

          uint64_t v18 = [v12 toggleItemIdentifier];

          if (v18)
          {
            uint64_t v19 = [v12 toggleItemIdentifier];
            [v17 setObject:v19 forKey:@"toggleId"];
          }
          CGFloat v9 = v21;
        }
        else
        {
          uint64_t v17 = 0;
        }
        objc_msgSend(v8, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, v17, 0, v21);
      }
    }
  }
}

- (void)_imageTapAction:(id)a3
{
  listElement = self->_listElement;
  id v5 = a3;
  id v10 = [(SKUIViewElement *)listElement flattenedChildren];
  CGFloat v6 = [(SKUIViewReuseView *)self allExistingViews];
  unint64_t v7 = [v5 view];

  unint64_t v8 = [v6 indexOfObjectIdenticalTo:v7];
  if (v8 < [v10 count])
  {
    CGFloat v9 = [v10 objectAtIndex:v8];
    [v9 dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];
  }
}

- (void)_menuButtonAction:(id)a3
{
  id v24 = a3;
  popoverController = self->_popoverController;
  if (popoverController)
  {
    [(SKUIMenuPopoverController *)popoverController setDelegate:0];
    [(SKUIMenuPopoverController *)self->_popoverController dismissAnimated:1];
    focusedMenuButton = self->_focusedMenuButton;
    self->_focusedMenuButton = 0;

    unint64_t v7 = self->_popoverController;
    self->_popoverController = 0;
  }
  unint64_t v8 = [(SKUIHorizontalListView *)self _viewElementForView:v24];
  if (v8)
  {
    p_focusedMenuButton = &self->_focusedMenuButton;
    objc_storeStrong((id *)&self->_focusedMenuButton, a3);
    id v10 = [SKUIMenuPopoverController alloc];
    double v11 = [v8 menuItemTitles];
    id v12 = -[SKUIMenuPopoverController initWithMenuTitles:selectedIndex:](v10, "initWithMenuTitles:selectedIndex:", v11, [v8 selectedItemIndex]);
    double v13 = self->_popoverController;
    self->_popoverController = v12;

    [(SKUIMenuPopoverController *)self->_popoverController setDelegate:self];
    uint64_t v14 = self->_popoverController;
    [(UIControl *)*p_focusedMenuButton frame];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    uint64_t v23 = [(UIControl *)*p_focusedMenuButton superview];
    -[SKUIMenuPopoverController presentFromRect:inView:permittedArrowDirections:animated:](v14, "presentFromRect:inView:permittedArrowDirections:animated:", v23, 15, 1, v16, v18, v20, v22);
  }
}

+ (id)_attributedStringForButton:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v6 buttonText];
  uint64_t v9 = [v6 buttonViewType];
  id v10 = [v6 buttonTitleStyle];
  if (v10)
  {
    double v11 = [a1 _attributedStringForButtonText:v8 type:v9 style:v10 context:v7];
  }
  else
  {
    id v12 = [v6 style];
    double v11 = [a1 _attributedStringForButtonText:v8 type:v9 style:v12 context:v7];
  }

  return v11;
}

+ (id)_attributedStringForButtonText:(id)a3 type:(int64_t)a4 style:(id)a5 context:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = SKUIViewElementFontWithStyle(v10);
  if (!v12)
  {
    if (a4) {
      uint64_t v13 = 5;
    }
    else {
      uint64_t v13 = 1;
    }
    id v12 = SKUIFontPreferredFontForTextStyle(v13);
  }
  uint64_t v14 = [v11 tintColor];
  double v15 = SKUIViewElementPlainColorWithStyle(v10, v14);

  if (!v15)
  {
    double v15 = [MEMORY[0x1E4FB1618] blackColor];
  }
  double v16 = [v9 attributedStringWithDefaultFont:v12 foregroundColor:v15 style:v10];

  return v16;
}

+ (id)_attributedStringForLabel:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 style];
  unint64_t v8 = SKUIViewElementFontWithStyle(v7);
  if (!v8)
  {
    unint64_t v8 = SKUIFontPreferredFontForTextStyle(5);
  }
  id v9 = [v6 tintColor];
  id v10 = SKUIViewElementPlainColorWithStyle(v7, v9);

  if (!v10)
  {
    id v10 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.8];
  }
  id v11 = [v5 text];
  id v12 = [v11 attributedStringWithDefaultFont:v8 foregroundColor:v10 style:v7];

  return v12;
}

+ (id)_attributedStringForMenuItem:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [v7 itemText];
  id v9 = [v7 style];

  id v10 = [a1 _attributedStringForButtonText:v8 type:0 style:v9 context:v6];

  return v10;
}

+ (double)_elementSpacingForViewElement:(id)a3
{
  uint64_t v3 = [a3 elementType];
  double result = 5.0;
  char v5 = v3 - 8;
  if ((unint64_t)(v3 - 8) <= 0x3A)
  {
    if (((1 << v5) & 0x40000000030) != 0) {
      return 20.0;
    }
    if (((1 << v5) & 0x20000000001) != 0) {
      return result;
    }
    if (v3 == 66) {
      return 10.0;
    }
  }
  if (v3 == 152) {
    return result;
  }
  if (v3 == 141) {
    return 20.0;
  }
  return 8.0;
}

+ (double)_lineSpacingForLineElements:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    double v8 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        [a1 _lineSpacingForViewElement:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        if (v8 < v10) {
          double v8 = v10;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  else
  {
    double v8 = 0.0;
  }

  return v8;
}

+ (double)_lineSpacingForViewElement:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 elementType];
  if (v4 == 66)
  {
    uint64_t v7 = [v3 firstChildForElementType:138];
    if (v7) {
      double v6 = 15.0;
    }
    else {
      double v6 = 10.0;
    }
  }
  else
  {
    double v5 = 0.0;
    if (v4 == 8) {
      double v5 = 5.0;
    }
    if (v4 == 49) {
      double v6 = 5.0;
    }
    else {
      double v6 = v5;
    }
  }

  return v6;
}

+ (id)_linesWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  double v10 = objc_alloc_init(SKUIViewElementHorizontalLayout);
  [(SKUIViewElementHorizontalLayout *)v10 setLayoutWidth:a4];
  id v11 = [v8 style];
  -[SKUIViewElementHorizontalLayout setMaximumElementsPerLine:](v10, "setMaximumElementsPerLine:", [v11 columnCount]);
  -[SKUIViewElementHorizontalLayout setMaximumLines:](v10, "setMaximumLines:", [v11 maxTextLines]);
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v25 = 0;
  double v26 = (double *)&v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __62__SKUIHorizontalListView__linesWithViewElement_width_context___block_invoke;
  v21[3] = &unk_1E64260A8;
  uint64_t v23 = &v25;
  id v24 = a1;
  id v13 = v12;
  id v22 = v13;
  [v8 enumerateChildrenUsingBlock:v21];
  [(SKUIViewElementHorizontalLayout *)v10 setElementSpacing:v26[3]];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __62__SKUIHorizontalListView__linesWithViewElement_width_context___block_invoke_2;
  v17[3] = &unk_1E6424450;
  id v19 = a1;
  double v20 = a4;
  id v14 = v9;
  id v18 = v14;
  long long v15 = [(SKUIViewElementHorizontalLayout *)v10 layoutViewElements:v13 usingSizingBlock:v17];

  _Block_object_dispose(&v25, 8);

  return v15;
}

void __62__SKUIHorizontalListView__linesWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 48);
  double v4 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  id v6 = a2;
  [v3 _elementSpacingForViewElement:v6];
  if (v4 >= v5) {
    double v5 = v4;
  }
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5;
  [*(id *)(a1 + 32) addObject:v6];
}

uint64_t __62__SKUIHorizontalListView__linesWithViewElement_width_context___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 40) _sizeForViewElement:a2 width:*(void *)(a1 + 32) context:*(double *)(a1 + 48)];
}

+ (CGSize)_sizeForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ([v7 elementType] == 66)
  {
    +[SKUIVerticalLockupView sizeThatFitsWidth:v7 viewElement:v8 context:a4];
    double v10 = v9;
    double v12 = v11;
    id v13 = [v7 firstChildForElementType:49];
    if (v13)
    {
      [v8 sizeForViewElement:v13 width:a4];
      double v10 = v14;
    }
  }
  else
  {
    [v8 sizeForViewElement:v7 width:a4];
    double v10 = v15;
    double v12 = v16;
  }

  double v17 = v10;
  double v18 = v12;
  result.double height = v18;
  result.double width = v17;
  return result;
}

- (void)_destroyMenuPopover
{
  [(SKUIMenuPopoverController *)self->_popoverController setDelegate:0];
  focusedMenuButton = self->_focusedMenuButton;
  self->_focusedMenuButton = 0;

  popoverController = self->_popoverController;
  self->_popoverController = 0;
}

- (id)_viewElementForView:(id)a3
{
  listElement = self->_listElement;
  id v5 = a3;
  id v6 = [(SKUIViewElement *)listElement flattenedChildren];
  id v7 = [(SKUIViewReuseView *)self allExistingViews];
  unint64_t v8 = [v7 indexOfObjectIdenticalTo:v5];

  if (v8 >= [v6 count])
  {
    double v9 = 0;
  }
  else
  {
    double v9 = [v6 objectAtIndex:v8];
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_popoverController, 0);
  objc_storeStrong((id *)&self->_listElement, 0);
  objc_storeStrong((id *)&self->_lines, 0);
  objc_storeStrong((id *)&self->_imageViewToImageResourceCacheKey, 0);
  objc_storeStrong((id *)&self->_focusedMenuButton, 0);

  objc_storeStrong((id *)&self->_artworkRequestPassthroughViews, 0);
}

- (void)initWithFrame:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)prefetchResourcesForViewElement:(uint64_t)a3 reason:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)preferredSizeForViewElement:context:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "+[SKUIHorizontalListView preferredSizeForViewElement:context:]";
}

+ (void)requestLayoutForViewElement:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)sizeThatFitsWidth:(uint64_t)a3 viewElement:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end