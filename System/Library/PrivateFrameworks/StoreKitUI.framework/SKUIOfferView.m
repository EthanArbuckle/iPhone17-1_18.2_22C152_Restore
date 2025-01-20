@interface SKUIOfferView
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (id)_attributedStringForButton:(id)a3 context:(id)a4;
+ (id)_attributedStringForLabel:(id)a3 context:(id)a4;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)_shouldHideNoticesWithBuyButtonDescriptor:(id)a3 context:(id)a4;
- (BOOL)isCompactModeEnabled;
- (BOOL)isShowingConfirmation;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSMapTable)buttonElements;
- (NSMapTable)buyButtonDescriptorToButton;
- (NSMapTable)notices;
- (NSMutableArray)metadataViews;
- (NSMutableArray)offerButtonViews;
- (NSNumber)hlsID;
- (NSString)offerViewStateDescription;
- (SKUIOfferView)initWithFrame:(CGRect)a3;
- (SKUIOfferViewDelegate)delegate;
- (UIButton)hlsPlayButton;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)viewForElementIdentifier:(id)a3;
- (int64_t)metadataPosition;
- (unint64_t)alignment;
- (void)_buttonAction:(id)a3;
- (void)_cancelConfirmationAction:(id)a3;
- (void)_sendWillAnimate;
- (void)_showConfirmationAction:(id)a3;
- (void)itemOfferButtonDidAnimateTransition:(id)a3;
- (void)itemOfferButtonWillAnimateTransition:(id)a3;
- (void)layoutSubviews;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (void)setAlignment:(unint64_t)a3;
- (void)setButtonElements:(id)a3;
- (void)setBuyButtonDescriptorToButton:(id)a3;
- (void)setCompactModeEnabled:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setHlsID:(id)a3;
- (void)setHlsPlayButton:(id)a3;
- (void)setMetadataPosition:(int64_t)a3;
- (void)setMetadataViews:(id)a3;
- (void)setNotices:(id)a3;
- (void)setOfferButtonViews:(id)a3;
- (void)setShowingConfirmation:(BOOL)a3;
@end

@implementation SKUIOfferView

- (SKUIOfferView)initWithFrame:(CGRect)a3
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
        -[SKUIOfferView initWithFrame:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  v24.receiver = self;
  v24.super_class = (Class)SKUIOfferView;
  v16 = -[SKUIViewReuseView initWithFrame:](&v24, sel_initWithFrame_, x, y, width, height);
  if (v16)
  {
    uint64_t v17 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:517 valueOptions:0 capacity:0];
    buttonElements = v16->_buttonElements;
    v16->_buttonElements = (NSMapTable *)v17;

    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    metadataViews = v16->_metadataViews;
    v16->_metadataViews = v19;

    v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    offerButtonViews = v16->_offerButtonViews;
    v16->_offerButtonViews = v21;

    -[SKUIOfferView setLayoutMargins:](v16, "setLayoutMargins:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    [(SKUIOfferView *)v16 setPreservesSuperviewLayoutMargins:0];
  }
  return v16;
}

- (NSString)offerViewStateDescription
{
  v3 = [(SKUIOfferView *)self offerButtonViews];
  uint64_t v4 = [v3 count];

  if (v4 == 1)
  {
    v5 = [(SKUIOfferView *)self offerButtonViews];
    v6 = [v5 firstObject];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [v6 offerButtonStateDescription];
    }
    else
    {
      v7 = &stru_1F1C879E8;
    }
  }
  else
  {
    v7 = &stru_1F1C879E8;
  }

  return (NSString *)v7;
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
        +[SKUIOfferView prefetchResourcesForViewElement:reason:context:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __64__SKUIOfferView_prefetchResourcesForViewElement_reason_context___block_invoke;
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

uint64_t __64__SKUIOfferView_prefetchResourcesForViewElement_reason_context___block_invoke(uint64_t a1, uint64_t a2)
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
  id v6 = a4;
  id v7 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    +[SKUIOfferView preferredSizeForViewElement:context:]();
  }
  [v6 defaultItemWidthForViewElement:v7];
  objc_msgSend(a1, "sizeThatFitsWidth:viewElement:context:", v7, v6);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v10) {
        +[SKUIOfferView requestLayoutForViewElement:width:context:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  *(double *)&v27[3] = a4;
  char v18 = [v9 labelLayoutCache];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __59__SKUIOfferView_requestLayoutForViewElement_width_context___block_invoke;
  v21[3] = &unk_1E642AC38;
  id v25 = a1;
  id v19 = v9;
  id v22 = v19;
  id v20 = v18;
  double v26 = a4;
  id v23 = v20;
  uint64_t v24 = v27;
  [v8 enumerateChildrenUsingBlock:v21];

  _Block_object_dispose(v27, 8);
}

void __59__SKUIOfferView_requestLayoutForViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = [v9 elementType];
  if (v3 > 137)
  {
    if (v3 == 138)
    {
      id v5 = v9;
      id v6 = [*(id *)(a1 + 56) _attributedStringForLabel:v5 context:*(void *)(a1 + 32)];
      uint64_t v7 = [v5 labelViewStyle];
      id v8 = *(void **)(a1 + 40);
      if (v7 == 3)
      {
        [v8 requestLayoutForLabel:v5 attributedString:v6 width:(uint64_t)*(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
        *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(void *)(a1 + 64);
      }
      else
      {
        [v8 requestLayoutForLabel:v5 attributedString:v6 width:(uint64_t)*(double *)(a1 + 64)];
      }

      goto LABEL_12;
    }
    if (v3 != 141) {
      goto LABEL_13;
    }
LABEL_7:
    id v5 = [*(id *)(a1 + 56) _attributedStringForButton:v9 context:*(void *)(a1 + 32)];
    [*(id *)(a1 + 40) requestLayoutForButton:v9 attributedString:v5 width:(uint64_t)*(double *)(a1 + 64)];
LABEL_12:

    goto LABEL_13;
  }
  if (v3 == 12) {
    goto LABEL_7;
  }
  if (v3 == 13)
  {
    [*(id *)(a1 + 32) sizeForItemOfferButton:v9];
    *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v4 + 10.0;
  }
LABEL_13:
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v9) {
        +[SKUIOfferView sizeThatFitsWidth:viewElement:context:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  uint64_t v17 = (double *)MEMORY[0x1E4F1DB30];
  uint64_t v74 = 0;
  v75 = (double *)&v74;
  uint64_t v76 = 0x3010000000;
  uint64_t v78 = 0;
  uint64_t v79 = 0;
  v77 = &unk_1C1D0F257;
  v73[0] = 0;
  v73[1] = v73;
  v73[2] = 0x2020000000;
  *(double *)&v73[3] = a3;
  uint64_t v69 = 0;
  v70 = &v69;
  uint64_t v71 = 0x2020000000;
  uint64_t v72 = 0;
  uint64_t v64 = 0;
  v65 = (double *)&v64;
  uint64_t v66 = 0x3010000000;
  v67 = &unk_1C1D0F257;
  long long v68 = xmmword_1C1CCC870;
  uint64_t v60 = 0;
  v61 = &v60;
  uint64_t v62 = 0x2020000000;
  uint64_t v63 = 0;
  uint64_t v55 = 0;
  v56 = (double *)&v55;
  uint64_t v57 = 0x3010000000;
  v58 = &unk_1C1D0F257;
  long long v59 = *MEMORY[0x1E4F1DB30];
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2020000000;
  char v54 = 0;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __55__SKUIOfferView_sizeThatFitsWidth_viewElement_context___block_invoke;
  v40[3] = &unk_1E642AC60;
  id v18 = v8;
  double v50 = a3;
  id v41 = v18;
  v43 = &v55;
  v44 = &v60;
  v45 = &v64;
  v46 = v73;
  v47 = &v69;
  id v19 = v7;
  id v42 = v19;
  v48 = &v51;
  v49 = &v74;
  [v19 enumerateChildrenUsingBlock:v40];
  double v21 = *v17;
  double v20 = v17[1];
  if (v75[4] == *v17 && v75[5] == v20)
  {
    id v22 = v65;
  }
  else
  {
    int v23 = [v19 isCompactModeEnabled];
    id v22 = v65;
    if (v23) {
      v65[4] = v75[4] + 10.0 + v65[4];
    }
    else {
      v65[5] = v75[5] + 3.0 + v65[5];
    }
  }
  if (v22[5] >= v56[5]) {
    double v24 = v22[5];
  }
  else {
    double v24 = v56[5];
  }
  uint64_t v25 = v70[3];
  double v26 = v21;
  if (v25 >= 1)
  {
    double v26 = v21 + 10.0;
    if (v61[3] <= 0) {
      double v26 = v21;
    }
    uint64_t v27 = v25 - 1;
    if (v27) {
      double v26 = v26 + (float)((float)v27 * 20.0);
    }
  }
  double v28 = v26 + v22[4] + v56[4];
  if (v28 < a3) {
    a3 = v28;
  }
  v29 = [v19 attributes];
  v30 = [v29 objectForKey:@"supportsPlayButton"];
  if ([v30 BOOLValue])
  {
    int v31 = *((unsigned __int8 *)v52 + 24);

    if (!v31)
    {
      double v32 = *(double *)&sizeThatFitsWidth_viewElement_context__sPlayButtonSize_0;
      double v33 = *(double *)&sizeThatFitsWidth_viewElement_context__sPlayButtonSize_1;
      if (*(double *)&sizeThatFitsWidth_viewElement_context__sPlayButtonSize_0 == v21
        && *(double *)&sizeThatFitsWidth_viewElement_context__sPlayButtonSize_1 == v20)
      {
        v34 = objc_msgSend(MEMORY[0x1E4FB1618], "blackColor", *(double *)&sizeThatFitsWidth_viewElement_context__sPlayButtonSize_1, *(double *)&sizeThatFitsWidth_viewElement_context__sPlayButtonSize_0);
        v35 = +[SKUIItemOfferButton playImageWithTintColor:v34];
        [v35 size];
        sizeThatFitsWidth_viewElement_context__sPlayButtonSize_0 = v36;
        sizeThatFitsWidth_viewElement_context__sPlayButtonSize_1 = v37;

        double v32 = *(double *)&sizeThatFitsWidth_viewElement_context__sPlayButtonSize_0;
        double v33 = *(double *)&sizeThatFitsWidth_viewElement_context__sPlayButtonSize_1;
      }
      a3 = a3 + v32 + 20.0;
      if (v33 >= v24) {
        double v24 = v33;
      }
    }
  }
  else
  {
  }
  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(v73, 8);
  _Block_object_dispose(&v74, 8);

  double v38 = a3;
  double v39 = v24;
  result.double height = v39;
  result.double width = v38;
  return result;
}

void __55__SKUIOfferView_sizeThatFitsWidth_viewElement_context___block_invoke(uint64_t a1, void *a2)
{
  id v34 = a2;
  uint64_t v3 = [v34 elementType];
  if (v3 > 49)
  {
    if (v3 != 141)
    {
      if (v3 != 138)
      {
        if (v3 != 50) {
          goto LABEL_31;
        }
        goto LABEL_13;
      }
      id v7 = v34;
      uint64_t v12 = [v7 labelViewStyle];
      uint64_t v13 = [*(id *)(a1 + 32) labelLayoutCache];
      uint64_t v14 = v13;
      if (v12 == 3)
      {
        [v13 sizeForLabel:v7 width:*(double *)(*(void *)(*(void *)(a1 + 96) + 8) + 32)];
        double v16 = v15;
        double v18 = v17;

        uint64_t v19 = *(void *)(*(void *)(a1 + 96) + 8);
        double v20 = *(double *)(v19 + 40);
        if (v20 < v18) {
          double v20 = v18;
        }
        *(double *)(v19 + 40) = v20;
        uint64_t v21 = *(void *)(*(void *)(a1 + 96) + 8);
        double v22 = *(double *)(v21 + 32);
        if (v22 < v16) {
          double v22 = v16;
        }
        *(double *)(v21 + 32) = v22;
        *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = *(void *)(a1 + 104);
      }
      else
      {
        [v13 sizeForLabel:v7 width:*(double *)(a1 + 104)];
        double v24 = v23;
        double v26 = v25;

        *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v26
                                                                    + *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                                + 40);
        uint64_t v27 = *(void *)(*(void *)(a1 + 48) + 8);
        double v28 = *(double *)(v27 + 32);
        if (v28 < v24) {
          double v28 = v24;
        }
        *(double *)(v27 + 32) = v28;
        ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      }
LABEL_30:

      goto LABEL_31;
    }
LABEL_8:
    [*(id *)(a1 + 32) sizeForViewElement:v34 width:*(double *)(a1 + 104)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
    if (*(double *)(v6 + 40) >= v5) {
      double v5 = *(double *)(v6 + 40);
    }
    *(double *)(v6 + 40) = v5;
    *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 32) = v4
                                                                + *(double *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                            + 32);
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                            + 32);
    ++*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    id v7 = [*(id *)(a1 + 40) attributes];
    id v8 = [v7 objectForKey:@"supportsPlayButton"];
    if ([v8 BOOLValue] && !*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24))
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0) {
        goto LABEL_31;
      }
      uint64_t v30 = [v34 itemIdentifier];
      if (!v30) {
        goto LABEL_31;
      }
      uint64_t v31 = v30;
      double v32 = +[SKUIItemStateCenter defaultCenter];
      id v7 = [v32 stateForItemWithIdentifier:v31];

      unsigned int v33 = ([v7 state] >> 6) & 1;
      if (!v7) {
        LOBYTE(v33) = 0;
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = v33;
    }
    else
    {
    }
    goto LABEL_30;
  }
  if (v3 != 12)
  {
    if (v3 != 13) {
      goto LABEL_31;
    }
    goto LABEL_8;
  }
LABEL_13:
  [*(id *)(a1 + 32) sizeForViewElement:v34 width:*(double *)(a1 + 104)];
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v10
                                                              + *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                          + 40);
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(double *)(v11 + 32) >= v9) {
    double v9 = *(double *)(v11 + 32);
  }
  *(double *)(v11 + 32) = v9;
  ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
LABEL_31:
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  double v10 = [(SKUIOfferView *)self buttonElements];
  [v10 removeAllObjects];

  uint64_t v11 = [(SKUIOfferView *)self buyButtonDescriptorToButton];
  [v11 removeAllObjects];

  uint64_t v12 = [(SKUIOfferView *)self metadataViews];
  [v12 removeAllObjects];

  uint64_t v13 = [(SKUIOfferView *)self offerButtonViews];
  [v13 removeAllObjects];

  [(SKUIOfferView *)self setHlsID:0];
  uint64_t v14 = [(SKUIOfferView *)self hlsPlayButton];
  [v14 removeFromSuperview];

  [(SKUIOfferView *)self setHlsPlayButton:0];
  [(SKUIOfferView *)self setShowingConfirmation:0];
  [(SKUIOfferView *)self setNotices:0];
  -[SKUIOfferView setCompactModeEnabled:](self, "setCompactModeEnabled:", [v8 isCompactModeEnabled]);
  double v15 = [v8 style];
  uint64_t v16 = [v15 elementAlignment];

  if (v16 == 3) {
    uint64_t v17 = 3;
  }
  else {
    uint64_t v17 = 1;
  }
  [(SKUIOfferView *)self setAlignment:v17];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __53__SKUIOfferView_reloadWithViewElement_width_context___block_invoke;
  v20[3] = &unk_1E64234F8;
  double v24 = a4;
  id v21 = v8;
  id v22 = v9;
  double v23 = self;
  id v18 = v9;
  id v19 = v8;
  [(SKUIViewReuseView *)self modifyUsingBlock:v20];
}

void __53__SKUIOfferView_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  char v34 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  char v32 = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__103;
  v29[4] = __Block_byref_object_dispose__103;
  id v30 = 0;
  uint64_t v25 = 0;
  double v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  double v4 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__SKUIOfferView_reloadWithViewElement_width_context___block_invoke_27;
  v10[3] = &unk_1E642AC88;
  id v5 = v3;
  id v11 = v5;
  uint64_t v20 = *(void *)(a1 + 56);
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  id v12 = v6;
  uint64_t v13 = v7;
  double v15 = v33;
  uint64_t v16 = v29;
  uint64_t v17 = v31;
  id v14 = *(id *)(a1 + 32);
  id v18 = &v21;
  id v19 = &v25;
  [v4 enumerateChildrenUsingBlock:v10];
  uint64_t v8 = v26[3];
  BOOL v9 = v8 < 1 || v8 < v22[3];
  *(void *)(*(void *)(a1 + 48) + 440) = v9;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(v29, 8);

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v33, 8);
}

void __53__SKUIOfferView_reloadWithViewElement_width_context___block_invoke_27(uint64_t a1, void *a2)
{
  id v45 = a2;
  uint64_t v3 = [v45 elementType];
  id v4 = 0;
  char v5 = 1;
  if (v3 <= 49)
  {
    if (v3 == 12)
    {
LABEL_24:
      uint64_t v7 = [*(id *)(a1 + 32) addButtonWithElement:v45 width:*(void *)(a1 + 40) context:*(double *)(a1 + 104)];
      [v7 addTarget:*(void *)(a1 + 48) action:sel__buttonAction_ forControlEvents:64];
      [v7 addTarget:0 action:sel_skuiadvertising_advertSelectionEventShouldBeForwarded_ forControlEvents:64];
      if (v7)
      {
LABEL_25:
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
          uint64_t v31 = *(void *)(a1 + 88);
        }
        else {
          uint64_t v31 = *(void *)(a1 + 96);
        }
        ++*(void *)(*(void *)(v31 + 8) + 24);
        id v30 = [*(id *)(a1 + 48) metadataViews];
        [v30 addObject:v7];
        id v4 = 0;
        id v6 = 0;
        char v8 = 0;
        goto LABEL_34;
      }
      goto LABEL_36;
    }
    id v6 = 0;
    uint64_t v7 = 0;
    char v8 = 1;
    if (v3 != 13) {
      goto LABEL_38;
    }
LABEL_8:
    BOOL v9 = [*(id *)(a1 + 32) addButtonWithElement:v45 width:*(void *)(a1 + 40) context:*(double *)(a1 + 104)];
    [v9 addTarget:*(void *)(a1 + 48) action:sel__buttonAction_ forControlEvents:0x20000];
    [v9 addTarget:*(void *)(a1 + 48) action:sel__cancelConfirmationAction_ forControlEvents:0x10000];
    [v9 addTarget:*(void *)(a1 + 48) action:sel__showConfirmationAction_ forControlEvents:0x40000];
    [v9 addTarget:0 action:sel_skuiadvertising_advertSelectionEventShouldBeForwarded_ forControlEvents:64];
    LODWORD(v10) = -0.5;
    [v9 setCharge:v10];
    [v9 setItemOfferDelegate:*(void *)(a1 + 48)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v9);
    id v4 = v9;
    id v11 = *(void **)(a1 + 48);
    id v12 = [v45 buyButtonDescriptor];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = [v11 _shouldHideNoticesWithBuyButtonDescriptor:v12 context:*(void *)(a1 + 40)];

    if (!v4)
    {
      id v6 = 0;
      goto LABEL_31;
    }
    uint64_t v13 = [v45 buyButtonDescriptor];
    if (v13)
    {
      id v14 = [*(id *)(a1 + 48) buyButtonDescriptorToButton];

      if (!v14)
      {
        double v15 = (void *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:517 capacity:1];
        [*(id *)(a1 + 48) setBuyButtonDescriptorToButton:v15];
      }
      uint64_t v16 = [*(id *)(a1 + 48) buyButtonDescriptorToButton];
      [v16 setObject:v4 forKey:v13];
    }
    uint64_t v17 = [*(id *)(a1 + 56) attributes];
    id v18 = [(SKUIStoreIdentifier *)v17 objectForKey:@"supportsPlayButton"];
    if ([v18 BOOLValue])
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
LABEL_22:

        id v30 = [*(id *)(a1 + 48) offerButtonViews];
        [v30 addObject:v4];
        char v5 = 0;
        id v6 = 0;
        uint64_t v7 = 0;
        goto LABEL_23;
      }
      uint64_t v17 = -[SKUIStoreIdentifier initWithLongLong:]([SKUIStoreIdentifier alloc], "initWithLongLong:", [v45 itemIdentifier]);
      if (!v17)
      {
LABEL_21:

        goto LABEL_22;
      }
      uint64_t v20 = +[SKUIItemStateCenter defaultCenter];
      id v18 = [v20 stateForItemWithStoreIdentifier:v17];

      char v21 = [v18 state];
      if ([v45 buttonViewType] == 3 && (!v18 || (v21 & 0x40) == 0))
      {
        id v22 = objc_alloc_init(MEMORY[0x1E4FB14D0]);
        [v22 addTarget:*(void *)(a1 + 48) action:sel__buttonAction_ forControlEvents:64];
        uint64_t v23 = objc_opt_class();
        uint64_t v24 = [*(id *)(a1 + 48) backgroundColor];
        uint64_t v25 = [v23 playTintColorForBackgroundColor:v24];

        double v26 = [(id)objc_opt_class() playImageWithTintColor:v25];
        [v22 setImage:v26 forState:0];

        uint64_t v27 = [(id)objc_opt_class() playHighlightImageWithTintColor:v25];
        [v22 setImage:v27 forState:1];

        [v22 setAdjustsImageWhenHighlighted:1];
        [v22 sizeToFit];
        objc_msgSend(v22, "setEnabled:", objc_msgSend(v45, "isEnabled"));
        [*(id *)(a1 + 48) addSubview:v22];
        [*(id *)(a1 + 48) setHlsPlayButton:v22];
        uint64_t v28 = [(SKUIStoreIdentifier *)v17 numberValue];
        [*(id *)(a1 + 48) setHlsID:v28];

        v29 = [*(id *)(a1 + 48) buttonElements];
        [v29 setObject:v45 forKey:v22];
      }
    }

    goto LABEL_21;
  }
  if (v3 == 141) {
    goto LABEL_8;
  }
  if (v3 == 138)
  {
    if ([v45 labelViewStyle] != 3)
    {
      uint64_t v7 = [*(id *)(a1 + 32) addLabelViewWithElement:v45 width:*(void *)(a1 + 40) context:*(double *)(a1 + 104)];
      if (v7) {
        goto LABEL_25;
      }
LABEL_36:
      id v4 = 0;
      id v6 = 0;
      goto LABEL_37;
    }
    char v32 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    if (v32)
    {
      objc_msgSend(v32, "sizeThatFits:", *(double *)(MEMORY[0x1E4F1DB10] + 16), *(double *)(MEMORY[0x1E4F1DB10] + 24));
      double v34 = v33 + 10.0;
    }
    else
    {
      double v34 = *(double *)(a1 + 104);
    }
    uint64_t v40 = [*(id *)(a1 + 32) addLabelViewWithElement:v45 width:*(void *)(a1 + 40) context:v34];
    id v6 = (void *)v40;
    if (v40)
    {
      if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
      {
        uint64_t v7 = (void *)v40;
        goto LABEL_25;
      }
      id v41 = [*(id *)(a1 + 48) notices];

      if (!v41)
      {
        id v42 = (void *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0 capacity:0];
        [*(id *)(a1 + 48) setNotices:v42];
      }
      v43 = [*(id *)(a1 + 48) notices];
      [v43 setObject:v6 forKey:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];

      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)) {
        [v6 setHidden:1];
      }
      id v4 = 0;
      uint64_t v7 = 0;
      uint64_t v44 = *(void *)(*(void *)(a1 + 72) + 8);
      id v30 = *(void **)(v44 + 40);
      *(void *)(v44 + 40) = 0;
LABEL_23:
      char v8 = 1;
LABEL_34:

      goto LABEL_38;
    }
    id v4 = 0;
LABEL_31:
    uint64_t v7 = 0;
LABEL_37:
    char v8 = 1;
    goto LABEL_38;
  }
  id v6 = 0;
  uint64_t v7 = 0;
  char v8 = 1;
  if (v3 == 50) {
    goto LABEL_24;
  }
LABEL_38:
  v35 = [*(id *)(a1 + 48) hlsPlayButton];

  if (v35)
  {
    uint64_t v36 = [*(id *)(a1 + 48) offerButtonViews];
    uint64_t v37 = [*(id *)(a1 + 48) hlsPlayButton];
    [v36 addObject:v37];
  }
  if (SKUIIKViewElementTypeIsButton([v45 elementType]))
  {
    if ((v8 & 1) == 0)
    {
      double v38 = [*(id *)(a1 + 48) buttonElements];
      [v38 setObject:v45 forKey:v7];
    }
    if ((v5 & 1) == 0)
    {
      double v39 = [*(id *)(a1 + 48) buttonElements];
      [v39 setObject:v45 forKey:v4];
    }
  }
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return 0;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  BOOL v23 = a5;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v22 = a4;
  uint64_t v24 = [v22 clientContext];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  char v8 = [(SKUIOfferView *)self buyButtonDescriptorToButton];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (!v9)
  {

LABEL_17:
    BOOL v20 = 0;
    goto LABEL_18;
  }
  uint64_t v10 = v9;
  char v11 = 0;
  uint64_t v12 = *(void *)v26;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v26 != v12) {
        objc_enumerationMutation(v8);
      }
      id v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
      if ([v14 canPersonalizeUsingItemState:v7])
      {
        double v15 = [(SKUIOfferView *)self buyButtonDescriptorToButton];
        uint64_t v16 = [v15 objectForKey:v14];

        [v16 setValuesUsingBuyButtonDescriptor:v14 itemState:v7 clientContext:v24 animated:v23];
        uint64_t v17 = [(SKUIOfferView *)self notices];

        if (v17)
        {
          id v18 = [(SKUIOfferView *)self notices];
          id v19 = [v18 objectForKey:v16];

          if (v19) {
            objc_msgSend(v19, "setHidden:", -[SKUIOfferView _shouldHideNoticesWithBuyButtonDescriptor:context:](self, "_shouldHideNoticesWithBuyButtonDescriptor:context:", v14, v22));
          }
        }
        char v11 = 1;
      }
    }
    uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
  }
  while (v10);

  if ((v11 & 1) == 0) {
    goto LABEL_17;
  }
  [(SKUIOfferView *)self setNeedsLayout];
  BOOL v20 = 1;
LABEL_18:

  return v20;
}

- (id)viewForElementIdentifier:(id)a3
{
  return 0;
}

- (void)layoutSubviews
{
  uint64_t v149 = *MEMORY[0x1E4F143B8];
  if (![(SKUIOfferView *)self isShowingConfirmation])
  {
    [(SKUIOfferView *)self layoutMargins];
    double v4 = v3;
    double v6 = v5;
    [(SKUIOfferView *)self bounds];
    CGFloat v128 = v7;
    CGFloat v9 = v8;
    double v11 = v10;
    double v126 = v12;
    double v123 = v4;
    double v13 = *MEMORY[0x1E4F1DB30];
    long long v141 = 0u;
    long long v142 = 0u;
    double v14 = v12 - v4 - v6;
    long long v143 = 0u;
    long long v144 = 0u;
    double v15 = [(SKUIOfferView *)self offerButtonViews];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v141 objects:v148 count:16];
    uint64_t v17 = (double *)MEMORY[0x1E4F1DB28];
    double v127 = v11;
    if (v16)
    {
      uint64_t v18 = v16;
      uint64_t v19 = 0;
      uint64_t v20 = *(void *)v142;
      double v21 = *MEMORY[0x1E4F1DB28];
      double v22 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v142 != v20) {
            objc_enumerationMutation(v15);
          }
          uint64_t v24 = *(void **)(*((void *)&v141 + 1) + 8 * i);
          if (([v24 isHidden] & 1) == 0)
          {
            objc_msgSend(v24, "sizeThatFits:", v126, v11);
            double v26 = v25;
            objc_msgSend(v24, "setFrame:", v21, v22, v25, v27);
            double v13 = v13 + v26;
            ++v19;
          }
        }
        uint64_t v18 = [v15 countByEnumeratingWithState:&v141 objects:v148 count:16];
      }
      while (v18);

      if (v19 >= 1)
      {
        if (v19 != 1) {
          double v13 = v13 + (float)((float)(v19 - 1) * 20.0);
        }
        double v14 = v14 - (v13 + 10.0);
      }
    }
    else
    {
    }
    double v28 = 0.0;
    long long v137 = 0u;
    long long v138 = 0u;
    if ([(SKUIOfferView *)self isCompactModeEnabled]) {
      double v29 = 0.0;
    }
    else {
      double v29 = v14;
    }
    double v120 = v29;
    long long v139 = 0uLL;
    long long v140 = 0uLL;
    uint64_t v30 = [(SKUIOfferView *)self metadataViews];
    uint64_t v31 = [v30 countByEnumeratingWithState:&v137 objects:v147 count:16];
    CGFloat v32 = v126;
    if (v31)
    {
      uint64_t v33 = v31;
      uint64_t v34 = *(void *)v138;
      CGFloat v35 = *v17;
      CGFloat v36 = v17[1];
      do
      {
        for (uint64_t j = 0; j != v33; ++j)
        {
          if (*(void *)v138 != v34) {
            objc_enumerationMutation(v30);
          }
          double v38 = *(void **)(*((void *)&v137 + 1) + 8 * j);
          objc_msgSend(v38, "sizeThatFits:", v126, v127);
          double v41 = v40;
          if (v39 >= v120) {
            CGFloat v42 = v120;
          }
          else {
            CGFloat v42 = v39;
          }
          SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v35, v36, v42, v40, v128, v9, v126, v127);
          objc_msgSend(v38, "setFrame:");
          double v28 = v28 + v41;
        }
        uint64_t v33 = [v30 countByEnumeratingWithState:&v137 objects:v147 count:16];
      }
      while (v33);
    }

    int64_t metadataPosition = self->_metadataPosition;
    double v44 = v123 + v13 + 10.0;
    if (!metadataPosition) {
      double v44 = v123;
    }
    double v119 = v44;
    long long v133 = 0u;
    long long v134 = 0u;
    long long v135 = 0u;
    long long v136 = 0u;
    id v45 = [(SKUIOfferView *)self offerButtonViews];
    uint64_t v46 = [v45 countByEnumeratingWithState:&v133 objects:v146 count:16];
    if (v46)
    {
      uint64_t v47 = v46;
      if (metadataPosition) {
        double v48 = v123;
      }
      else {
        double v48 = v123 + v120 + 10.0;
      }
      uint64_t v49 = *(void *)v134;
      double v112 = *v17;
      CGFloat v113 = v17[1];
      double v110 = v17[3];
      double v111 = v17[2];
      CGFloat v125 = v9;
      double v114 = v28;
      do
      {
        for (uint64_t k = 0; k != v47; ++k)
        {
          if (*(void *)v134 != v49) {
            objc_enumerationMutation(v45);
          }
          uint64_t v51 = *(void **)(*((void *)&v133 + 1) + 8 * k);
          if (objc_msgSend(v51, "isHidden", *(void *)&v110, *(void *)&v111, *(void *)&v112))
          {
            CGFloat v9 = v125;
            CGFloat v32 = v126;
          }
          else
          {
            [v51 frame];
            double v53 = v52;
            CGFloat v55 = v54;
            float v56 = (v127 - v54) * 0.5;
            double v57 = floorf(v56);
            SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v48, v57, v52, v54, v128, v125, v126, v127);
            objc_msgSend(v51, "setFrame:");
            v58 = [(SKUIOfferView *)self notices];
            long long v59 = [v58 objectForKey:v51];

            CGFloat v122 = v53;
            CGFloat v124 = v48;
            CGFloat v118 = v55;
            if (v59)
            {
              CGFloat rect = v57;
              BOOL v60 = [(SKUIOfferView *)self isCompactModeEnabled];
              objc_msgSend(v59, "sizeThatFits:", v53 + 10.0, 1.79769313e308);
              CGFloat v63 = v62;
              if (v61 >= v53 + 10.0) {
                double v64 = v53 + 10.0;
              }
              else {
                double v64 = v61;
              }
              CGFloat v116 = v64;
              CGFloat v117 = v62;
              if (v60)
              {
                v150.origin.double x = v48;
                v150.origin.double y = rect;
                v150.size.double width = v53;
                v150.size.double height = v55;
                double MidY = CGRectGetMidY(v150);
                v151.origin.double x = v48;
                v151.origin.double y = v113;
                v151.size.double width = v64;
                v151.size.double height = v63;
                CGFloat v66 = MidY + CGRectGetHeight(v151) * -0.5;
                double v67 = v55;
                SKUIRectByApplyingUserInterfaceLayoutDirectionInRect(v48, v66, v64, v63, v128, v125, v126, v127);
                objc_msgSend(v59, "setFrame:");
                v152.origin.double x = v48;
                v152.origin.double y = v66;
                v152.size.double width = v64;
                v152.size.double height = v63;
                double MaxY = CGRectGetMaxY(v152);
                v153.origin.double x = v48;
                v153.origin.double y = v66;
                v153.size.double width = v64;
                v153.size.double height = v63;
                CGFloat v69 = v48 + CGRectGetWidth(v153) + 10.0;
                double v57 = rect;
                CGFloat v70 = v67;
                double v71 = v66;
                CGFloat v72 = v127;
                CGFloat v73 = v125;
                SKUIRectByApplyingUserInterfaceLayoutDirectionInRect(v69, rect, v122, v70, v128, v125, v126, v127);
                objc_msgSend(v51, "setFrame:");
                double v121 = v124;
                CGFloat v124 = v69;
                CGFloat v74 = v126;
                CGFloat v75 = v128;
              }
              else
              {
                float v76 = v48 + (v53 - v64) * 0.5;
                float v77 = floorf(v76);
                v154.origin.double x = v48;
                CGFloat v78 = v77;
                double v121 = v77;
                v154.origin.double y = rect;
                v154.size.double width = v53;
                v154.size.double height = v55;
                double v71 = CGRectGetMaxY(v154) + 3.0;
                CGFloat v79 = v78;
                CGFloat v72 = v127;
                CGFloat v74 = v126;
                CGFloat v73 = v125;
                SKUIRectByApplyingUserInterfaceLayoutDirectionInRect(v79, v71, v64, v63, v128, v125, v126, v127);
                objc_msgSend(v59, "setFrame:");
                v155.origin.double x = v121;
                v155.origin.double y = v71;
                v155.size.double width = v64;
                double v57 = rect;
                v155.size.double height = v63;
                CGFloat v80 = CGRectGetMaxY(v155);
                CGFloat v75 = v128;
                double MaxY = v80;
              }
            }
            else
            {
              CGFloat v72 = v127;
              CGFloat v75 = v128;
              double MaxY = 0.0;
              CGFloat v116 = v111;
              CGFloat v117 = v110;
              double v71 = v113;
              double v121 = v112;
              CGFloat v73 = v125;
              CGFloat v74 = v126;
            }
            CGFloat v81 = v75;
            v156.origin.double x = v75;
            v156.origin.double y = v73;
            v156.size.double width = v74;
            v156.size.double height = v72;
            double v82 = CGRectGetMaxY(v156);
            if (MaxY <= v82)
            {
              double v88 = v57;
              CGFloat v86 = v122;
              CGFloat v85 = v124;
              CGFloat v92 = v117;
              CGFloat v87 = v118;
              CGFloat v94 = v121;
              CGFloat v90 = v116;
            }
            else
            {
              double v83 = MaxY - v82;
              CGFloat v84 = v72;
              CGFloat v85 = v124;
              v157.origin.double x = v124;
              v157.origin.double y = v57;
              CGFloat v86 = v122;
              v157.size.double width = v122;
              CGFloat v87 = v118;
              v157.size.double height = v118;
              double v88 = fmax(round(CGRectGetMinY(v157) - v83), 0.0);
              SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v124, v88, v122, v118, v81, v73, v74, v84);
              objc_msgSend(v51, "setFrame:");
              v158.origin.double x = v124;
              v158.origin.double y = v88;
              v158.size.double width = v122;
              v158.size.double height = v118;
              double v71 = CGRectGetMaxY(v158) + 3.0;
              CGFloat v89 = v73;
              CGFloat v90 = v116;
              CGFloat v91 = v74;
              CGFloat v92 = v117;
              CGFloat v93 = v81;
              CGFloat v94 = v121;
              SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v121, v71, v116, v117, v93, v89, v91, v127);
              objc_msgSend(v59, "setFrame:");
            }
            v159.origin.double x = v85;
            v159.origin.double y = v88;
            v159.size.double width = v86;
            v159.size.double height = v87;
            double MaxX = CGRectGetMaxX(v159);
            v160.origin.double x = v94;
            v160.origin.double y = v71;
            v160.size.double width = v90;
            v160.size.double height = v92;
            double v96 = CGRectGetMaxX(v160);
            if (MaxX >= v96) {
              double v96 = MaxX;
            }
            double v48 = v96 + 20.0;

            CGFloat v9 = v125;
            CGFloat v32 = v126;
            double v28 = v114;
          }
        }
        uint64_t v47 = [v45 countByEnumeratingWithState:&v133 objects:v146 count:16];
      }
      while (v47);
    }

    long long v131 = 0u;
    long long v132 = 0u;
    long long v129 = 0u;
    long long v130 = 0u;
    v97 = [(SKUIOfferView *)self metadataViews];
    uint64_t v98 = [v97 countByEnumeratingWithState:&v129 objects:v145 count:16];
    if (v98)
    {
      uint64_t v99 = v98;
      float v100 = (v127 - v28) * 0.5;
      double v101 = floorf(v100);
      uint64_t v102 = *(void *)v130;
      do
      {
        for (uint64_t m = 0; m != v99; ++m)
        {
          if (*(void *)v130 != v102) {
            objc_enumerationMutation(v97);
          }
          v104 = *(void **)(*((void *)&v129 + 1) + 8 * m);
          [v104 frame];
          double v106 = v105;
          CGFloat v108 = v107;
          if ([(SKUIOfferView *)self alignment] == 3) {
            double v109 = v120 + v119 - v106;
          }
          else {
            double v109 = v119;
          }
          SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v109, v101, v106, v108, v128, v9, v32, v127);
          objc_msgSend(v104, "setFrame:");
          v161.origin.double x = v109;
          v161.origin.double y = v101;
          v161.size.double width = v106;
          v161.size.double height = v108;
          double v101 = CGRectGetMaxY(v161);
        }
        uint64_t v99 = [v97 countByEnumeratingWithState:&v129 objects:v145 count:16];
      }
      while (v99);
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  double v5 = *MEMORY[0x1E4F1DB30];
  double v6 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  double v7 = [(SKUIOfferView *)self metadataViews];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v56 objects:v61 count:16];
  double v9 = v6;
  double v10 = v5;
  if (v8)
  {
    uint64_t v11 = v8;
    uint64_t v12 = *(void *)v57;
    double v9 = v6;
    double v10 = v5;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v57 != v12) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v56 + 1) + 8 * i), "sizeThatFits:", width, height);
        double v9 = v9 + v15;
        if (v10 < v14) {
          double v10 = v14;
        }
      }
      uint64_t v11 = [v7 countByEnumeratingWithState:&v56 objects:v61 count:16];
    }
    while (v11);
  }

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  uint64_t v16 = [(SKUIOfferView *)self offerButtonViews];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v52 objects:v60 count:16];
  double v18 = v6;
  double v19 = v5;
  double v49 = v6;
  double v50 = v5;
  if (v17)
  {
    uint64_t v20 = v17;
    uint64_t v21 = *(void *)v53;
    double v18 = v6;
    double v19 = v5;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v53 != v21) {
          objc_enumerationMutation(v16);
        }
        BOOL v23 = *(void **)(*((void *)&v52 + 1) + 8 * j);
        objc_msgSend(v23, "sizeThatFits:", width, height);
        double v26 = v25;
        if (v18 < v24) {
          double v18 = v24;
        }
        double v27 = [(SKUIOfferView *)self notices];
        double v28 = [v27 objectForKey:v23];

        if (v28)
        {
          BOOL v29 = [(SKUIOfferView *)self isCompactModeEnabled];
          objc_msgSend(v28, "sizeThatFits:", v26, 1.79769313e308);
          double v32 = v6 >= v31 ? v6 : v31;
          double v6 = v29 ? v31 : v32;
          if (v29) {
            double v5 = v30;
          }
        }
        double v19 = v19 + v26 + 10.0;
      }
      uint64_t v20 = [v16 countByEnumeratingWithState:&v52 objects:v60 count:16];
    }
    while (v20);
  }

  if (v5 != v50 || v6 != v49)
  {
    if ([(SKUIOfferView *)self isCompactModeEnabled])
    {
      double v19 = v19 + v5 + 10.0;
      if (v6 >= v18) {
        double v18 = v6;
      }
    }
    else
    {
      double v18 = v18 + v6 + 3.0;
    }
  }
  uint64_t v34 = [(SKUIOfferView *)self offerButtonViews];
  uint64_t v35 = [v34 count];

  CGFloat v36 = [(SKUIOfferView *)self metadataViews];
  uint64_t v37 = [v36 count];

  BOOL v38 = v35 <= 0 || v37 == 0;
  double v39 = v10 + v19 + 10.0;
  if (v38) {
    double v39 = v10 + v19;
  }
  if (v35 >= 2) {
    double v40 = v39 + (float)((float)(v35 - 1) * 20.0);
  }
  else {
    double v40 = v39;
  }
  if (v9 >= v18) {
    double v41 = v9;
  }
  else {
    double v41 = v18;
  }
  [(SKUIOfferView *)self layoutMargins];
  double v44 = v41 + v43 + v42;
  double v47 = v40 + v45 + v46;
  double v48 = v44;
  result.double height = v48;
  result.double width = v47;
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  uint64_t v8 = [(SKUIOfferView *)self hlsPlayButton];
  if (!v8) {
    goto LABEL_5;
  }
  double v9 = (void *)v8;
  double v10 = [(SKUIOfferView *)self hlsPlayButton];
  int v11 = [v10 isEnabled];

  if (!v11) {
    goto LABEL_5;
  }
  uint64_t v12 = [(SKUIOfferView *)self hlsPlayButton];
  [v12 frame];
  CGRect v24 = CGRectInset(v23, -10.0, -11.0);
  CGFloat v13 = v24.origin.x;
  CGFloat v14 = v24.origin.y;
  CGFloat width = v24.size.width;
  CGFloat height = v24.size.height;

  v25.origin.double x = v13;
  v25.origin.double y = v14;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  v22.double x = x;
  v22.double y = y;
  if (CGRectContainsPoint(v25, v22))
  {
    uint64_t v17 = [(SKUIOfferView *)self hlsPlayButton];
  }
  else
  {
LABEL_5:
    v20.receiver = self;
    v20.super_class = (Class)SKUIOfferView;
    uint64_t v17 = -[SKUIOfferView hitTest:withEvent:](&v20, sel_hitTest_withEvent_, v7, x, y);
  }
  double v18 = (void *)v17;

  return v18;
}

- (void)itemOfferButtonDidAnimateTransition:(id)a3
{
  id v6 = a3;
  if ([(SKUIOfferView *)self isShowingConfirmation]) {
    uint64_t v4 = [v6 isShowingConfirmation];
  }
  else {
    uint64_t v4 = 0;
  }
  [(SKUIOfferView *)self setShowingConfirmation:v4];
  double v5 = [(SKUIOfferView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 offerViewDidAnimateTransition:self];
  }
}

- (void)itemOfferButtonWillAnimateTransition:(id)a3
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(SKUIOfferView *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0 || [v5 offerViewAnimateTransition:self])
  {
    [v4 frame];
    double v7 = v6;
    double v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v14 = [(SKUIOfferView *)self offerButtonViews];
    uint64_t v15 = [v14 indexOfObjectIdenticalTo:v4];

    if (v15 != 0x7FFFFFFFFFFFFFFFLL)
    {
      int64_t metadataPosition = self->_metadataPosition;
      v70.origin.double x = v7;
      v70.origin.double y = v9;
      v70.size.CGFloat width = v11;
      v70.size.CGFloat height = v13;
      double MaxX = CGRectGetMaxX(v70);
      objc_msgSend(v4, "sizeThatFits:", *(double *)(MEMORY[0x1E4F1DB10] + 16), *(double *)(MEMORY[0x1E4F1DB10] + 24));
      double v19 = v18;
      double v21 = v20;
      int ShouldReverseLayoutDirection = storeShouldReverseLayoutDirection();
      if (metadataPosition)
      {
        if (ShouldReverseLayoutDirection) {
          double v7 = MaxX - v19;
        }
        objc_msgSend(v4, "setFrame:", v7, v9, v19, v21);
        CGRect v23 = [(SKUIOfferView *)self offerButtonViews];
        uint64_t v24 = [v23 count];

        if (storeShouldReverseLayoutDirection())
        {
          double v25 = v7 + -20.0;
        }
        else
        {
          v72.origin.double x = v7;
          v72.origin.double y = v9;
          v72.size.CGFloat width = v19;
          v72.size.CGFloat height = v21;
          double v25 = CGRectGetMaxX(v72);
        }
        uint64_t v27 = v15 + 1;
        if (v27 < v24)
        {
          do
          {
            double v28 = [(SKUIOfferView *)self offerButtonViews];
            BOOL v29 = [v28 objectAtIndex:v27];

            if (([v29 isHidden] & 1) == 0)
            {
              [v29 frame];
              double v31 = v30;
              double v33 = v32;
              double v35 = v34;
              if (storeShouldReverseLayoutDirection()) {
                double v36 = v33;
              }
              else {
                double v36 = -20.0;
              }
              objc_msgSend(v29, "setFrame:", v25 - v36, v31, v33, v35);
            }

            ++v27;
          }
          while (v24 != v27);
        }
        if ([(SKUIOfferView *)self alignment] != 3)
        {
          long long v66 = 0u;
          long long v67 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          uint64_t v37 = [(SKUIOfferView *)self metadataViews];
          uint64_t v38 = [v37 countByEnumeratingWithState:&v64 objects:v68 count:16];
          if (v38)
          {
            uint64_t v39 = v38;
            uint64_t v40 = *(void *)v65;
            do
            {
              for (uint64_t i = 0; i != v39; ++i)
              {
                if (*(void *)v65 != v40) {
                  objc_enumerationMutation(v37);
                }
                double v42 = *(void **)(*((void *)&v64 + 1) + 8 * i);
                [v42 frame];
                CGFloat v44 = v43;
                double v46 = v45;
                double v48 = v47;
                double v50 = v49;
                int v51 = storeShouldReverseLayoutDirection();
                double v52 = v25;
                if (v51)
                {
                  v73.origin.double x = v44;
                  v73.origin.double y = v46;
                  v73.size.CGFloat width = v48;
                  v73.size.CGFloat height = v50;
                  double v52 = v25 - CGRectGetWidth(v73);
                }
                objc_msgSend(v42, "setFrame:", v52 + 10.0, v46, v48, v50);
              }
              uint64_t v39 = [v37 countByEnumeratingWithState:&v64 objects:v68 count:16];
            }
            while (v39);
          }
        }
      }
      else
      {
        if (!ShouldReverseLayoutDirection) {
          double v7 = MaxX - v19;
        }
        objc_msgSend(v4, "setFrame:", v7, v9, v19, v21);
        if (storeShouldReverseLayoutDirection())
        {
          v71.origin.double x = v7;
          v71.origin.double y = v9;
          v71.size.CGFloat width = v19;
          v71.size.CGFloat height = v21;
          double v26 = CGRectGetMaxX(v71);
        }
        else
        {
          double v26 = v7 + -20.0;
        }
        if (v15 >= 1)
        {
          unint64_t v53 = v15 + 1;
          do
          {
            long long v54 = [(SKUIOfferView *)self offerButtonViews];
            long long v55 = [v54 objectAtIndex:v53 - 2];

            if (([v55 isHidden] & 1) == 0)
            {
              [v55 frame];
              double v57 = v56;
              double v59 = v58;
              double v61 = v60;
              if (storeShouldReverseLayoutDirection()) {
                double v62 = -20.0;
              }
              else {
                double v62 = v59;
              }
              double v63 = v26 - v62;
              objc_msgSend(v55, "setFrame:", v63, v57, v59, v61);
              if (storeShouldReverseLayoutDirection())
              {
                v74.origin.double x = v63;
                v74.origin.double y = v57;
                v74.size.CGFloat width = v59;
                v74.size.CGFloat height = v61;
                double v26 = CGRectGetMaxX(v74) + 20.0;
              }
              else
              {
                double v26 = v63 + -20.0;
              }
            }

            --v53;
          }
          while (v53 > 1);
        }
      }
    }
  }
  -[SKUIOfferView setShowingConfirmation:](self, "setShowingConfirmation:", [v4 isShowingConfirmation]);
}

- (void)_buttonAction:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(SKUIOfferView *)self buttonElements];
  double v6 = [v5 objectForKey:v4];

  id v7 = [(SKUIOfferView *)self hlsPlayButton];

  if (v7 == v4 && v6)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4FA82E0]);
    double v9 = [(SKUIOfferView *)self hlsID];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __31__SKUIOfferView__buttonAction___block_invoke;
    v16[3] = &unk_1E642ACB0;
    id v17 = v6;
    id v18 = v9;
    id v10 = v9;
    [v8 isRemovedSystemApplicationWithBundleIdentifier:@"com.apple.tv" completionBlock:v16];

    CGFloat v11 = v17;
LABEL_12:

    goto LABEL_13;
  }
  if (v6)
  {
    SKUICollectionViewCellForView(self);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    SKUICollectionViewForView(v8);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    CGFloat v11 = [v10 delegate];
    double v12 = [(SKUIOfferView *)self offerViewStateDescription];

    if (v12)
    {
      double v19 = @"action";
      CGFloat v13 = [(SKUIOfferView *)self offerViewStateDescription];
      v20[0] = v13;
      CGFloat v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    }
    else
    {
      CGFloat v14 = 0;
    }
    if (objc_opt_respondsToSelector())
    {
      uint64_t v15 = [v10 indexPathForCell:v8];
      [v11 collectionView:v10 didConfirmButtonElement:v6 withClickInfo:v14 forItemAtIndexPath:v15];
    }
    else
    {
      [v6 dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:v14 completionBlock:0];
    }

    goto LABEL_12;
  }
LABEL_13:
}

void __31__SKUIOfferView__buttonAction___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31__SKUIOfferView__buttonAction___block_invoke_2;
  v7[3] = &unk_1E642A920;
  char v11 = a2;
  id v8 = v5;
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __31__SKUIOfferView__buttonAction___block_invoke_2(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 56) && !*(void *)(a1 + 32))
  {
    id v6 = @"adam-identifier";
    v2 = *(void **)(a1 + 40);
    double v3 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 48), "longLongValue"));
    v7[0] = v3;
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
    [v2 dispatchEvent:@"playbackDisabledEvent" eventAttribute:@"onPlay" canBubble:1 isCancelable:0 extraInfo:v4 completionBlock:0];
  }
  else
  {
    id v5 = (id)objc_msgSend([NSString alloc], "initWithFormat:", @"videos://play?adam-id=%lld&allowCloudPlayback=1", objc_msgSend(*(id *)(a1 + 48), "longLongValue"));
    v1 = objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:");
    SKUIMetricsOpenSensitiveURL(v1, 0);
  }
}

- (void)_cancelConfirmationAction:(id)a3
{
  id v4 = a3;
  [(SKUIOfferView *)self setShowingConfirmation:0];
  [(SKUIOfferView *)self bringSubviewToFront:v4];
  [(SKUIOfferView *)self _sendWillAnimate];
  [v4 setShowingConfirmation:0 animated:1];
}

- (void)_showConfirmationAction:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SKUIOfferView *)self buttonElements];
  id v6 = [v5 objectForKey:v4];

  if (v6)
  {
    id v9 = @"action";
    id v7 = [(SKUIOfferView *)self offerViewStateDescription];
    v10[0] = v7;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    [v6 dispatchEvent:@"buyInitiate" eventAttribute:@"onbuyinitiate" canBubble:1 isCancelable:1 extraInfo:v8 completionBlock:0];
  }
  [(SKUIOfferView *)self bringSubviewToFront:v4];
  [(SKUIOfferView *)self _sendWillAnimate];
  [v4 setShowingConfirmation:1 animated:1];
}

+ (id)_attributedStringForButton:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 buttonTitleStyle];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [v5 style];
  }
  id v10 = v9;

  char v11 = SKUIViewElementFontWithStyle(v10);
  if (!v11)
  {
    char v11 = [MEMORY[0x1E4FB08E0] systemFontOfSize:9.0];
  }
  double v12 = [v6 tintColor];
  CGFloat v13 = SKUIViewElementPlainColorWithStyle(v10, v12);

  if (!v13)
  {
    CGFloat v13 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.6];
  }
  BOOL v14 = [v5 buttonViewType] == 9;
  uint64_t v15 = [v5 buttonText];
  uint64_t v16 = [v15 attributedStringWithDefaultFont:v11 foregroundColor:v13 textAlignment:v14 style:v10];

  return v16;
}

+ (id)_attributedStringForLabel:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 style];
  id v8 = SKUIViewElementFontWithStyle(v7);
  id v9 = [v6 tintColor];

  id v10 = SKUIViewElementPlainColorWithStyle(v7, v9);

  unint64_t v11 = [v5 labelViewStyle];
  if (v11 > 5) {
    goto LABEL_18;
  }
  if (((1 << v11) & 0x13) == 0)
  {
    if (((1 << v11) & 0x24) != 0)
    {
      if (v8)
      {
        if (v10) {
          goto LABEL_18;
        }
      }
      else
      {
        id v8 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
        if (v10) {
          goto LABEL_18;
        }
      }
      uint64_t v12 = [MEMORY[0x1E4FB1618] blackColor];
      goto LABEL_17;
    }
    if (v8)
    {
      if (v10)
      {
LABEL_14:
        uint64_t v13 = 1;
        goto LABEL_19;
      }
    }
    else
    {
      id v8 = [MEMORY[0x1E4FB08E0] systemFontOfSize:7.0];
      if (v10) {
        goto LABEL_14;
      }
    }
    id v10 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.6];
    goto LABEL_14;
  }
  if (v8)
  {
    if (!v10) {
      goto LABEL_11;
    }
  }
  else
  {
    id v8 = [MEMORY[0x1E4FB08E0] systemFontOfSize:9.0];
    if (!v10)
    {
LABEL_11:
      uint64_t v12 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.6];
LABEL_17:
      id v10 = (void *)v12;
    }
  }
LABEL_18:
  uint64_t v13 = 0;
LABEL_19:
  BOOL v14 = [v5 text];
  uint64_t v15 = [v14 attributedStringWithDefaultFont:v8 foregroundColor:v10 textAlignment:v13 style:v7];

  return v15;
}

- (void)_sendWillAnimate
{
  id v3 = [(SKUIOfferView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 offerViewWillAnimateTransition:self];
  }
}

- (BOOL)_shouldHideNoticesWithBuyButtonDescriptor:(id)a3 context:(id)a4
{
  id v4 = a3;
  uint64_t v5 = [v4 itemIdentifier];
  id v6 = [v4 storeIdentifier];

  if (!v6 && v5) {
    id v6 = [[SKUIStoreIdentifier alloc] initWithLongLong:v5];
  }
  BOOL v10 = 0;
  if (v6)
  {
    id v7 = +[SKUIItemStateCenter defaultCenter];
    id v8 = [v7 stateForItemWithStoreIdentifier:v6];

    uint64_t v9 = [v8 state] & 0xF;
    if (v9) {
      BOOL v10 = 1;
    }
  }

  return v10;
}

- (SKUIOfferViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUIOfferViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)metadataPosition
{
  return self->_metadataPosition;
}

- (void)setMetadataPosition:(int64_t)a3
{
  self->_int64_t metadataPosition = a3;
}

- (BOOL)isShowingConfirmation
{
  return self->_showingConfirmation;
}

- (void)setShowingConfirmation:(BOOL)a3
{
  self->_showingConfirmation = a3;
}

- (BOOL)isCompactModeEnabled
{
  return self->_compactModeEnabled;
}

- (void)setCompactModeEnabled:(BOOL)a3
{
  self->_compactModeEnabled = a3;
}

- (unint64_t)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(unint64_t)a3
{
  self->_alignment = a3;
}

- (NSMapTable)buttonElements
{
  return self->_buttonElements;
}

- (void)setButtonElements:(id)a3
{
}

- (NSMapTable)buyButtonDescriptorToButton
{
  return self->_buyButtonDescriptorToButton;
}

- (void)setBuyButtonDescriptorToButton:(id)a3
{
}

- (NSMapTable)notices
{
  return self->_notices;
}

- (void)setNotices:(id)a3
{
}

- (UIButton)hlsPlayButton
{
  return self->_hlsPlayButton;
}

- (void)setHlsPlayButton:(id)a3
{
}

- (NSNumber)hlsID
{
  return self->_hlsID;
}

- (void)setHlsID:(id)a3
{
}

- (NSMutableArray)metadataViews
{
  return self->_metadataViews;
}

- (void)setMetadataViews:(id)a3
{
}

- (NSMutableArray)offerButtonViews
{
  return self->_offerButtonViews;
}

- (void)setOfferButtonViews:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offerButtonViews, 0);
  objc_storeStrong((id *)&self->_metadataViews, 0);
  objc_storeStrong((id *)&self->_hlsID, 0);
  objc_storeStrong((id *)&self->_hlsPlayButton, 0);
  objc_storeStrong((id *)&self->_notices, 0);
  objc_storeStrong((id *)&self->_buyButtonDescriptorToButton, 0);
  objc_storeStrong((id *)&self->_buttonElements, 0);

  objc_destroyWeak((id *)&self->_delegate);
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
  v1 = "+[SKUIOfferView preferredSizeForViewElement:context:]";
}

+ (void)requestLayoutForViewElement:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)sizeThatFitsWidth:(uint64_t)a3 viewElement:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end