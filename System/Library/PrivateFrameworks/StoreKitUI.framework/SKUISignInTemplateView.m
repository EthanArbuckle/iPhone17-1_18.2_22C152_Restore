@interface SKUISignInTemplateView
+ (BOOL)_useEditorialLayoutForLabelElement:(id)a3;
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)_sizeForViewElement:(id)a3 width:(double)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (UIEdgeInsets)_marginsForViewElement:(id)a3 index:(unint64_t)a4 width:(double)a5 context:(id)a6;
+ (id)_attributedStringForText:(id)a3 style:(id)a4 context:(id)a5;
+ (void)_enumerateChildrenOfViewElement:(id)a3 usingBlock:(id)a4;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (SKUISignInTemplateView)initWithFrame:(CGRect)a3;
- (SKUISignInViewDelegate)delegate;
- (id)viewForElementIdentifier:(id)a3;
- (void)_buttonAction:(id)a3;
- (void)layoutSubviews;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation SKUISignInTemplateView

- (SKUISignInTemplateView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v8) {
        -[SKUISignInTemplateView initWithFrame:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  v22.receiver = self;
  v22.super_class = (Class)SKUISignInTemplateView;
  v16 = -[SKUIViewReuseView initWithFrame:](&v22, sel_initWithFrame_, x, y, width, height);
  if (v16)
  {
    uint64_t v17 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0 capacity:0];
    viewElements = v16->_viewElements;
    v16->_viewElements = (NSMapTable *)v17;

    uint64_t v19 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0 capacity:0];
    viewMargins = v16->_viewMargins;
    v16->_viewMargins = (NSMapTable *)v19;
  }
  return v16;
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v9) {
        +[SKUISignInTemplateView prefetchResourcesForViewElement:reason:context:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __73__SKUISignInTemplateView_prefetchResourcesForViewElement_reason_context___block_invoke;
  v20[3] = &unk_1E64234D0;
  id v17 = v8;
  objc_super v22 = &v24;
  int64_t v23 = a4;
  id v21 = v17;
  [v7 enumerateChildrenUsingBlock:v20];
  char v18 = *((unsigned char *)v25 + 24);

  _Block_object_dispose(&v24, 8);
  return v18;
}

uint64_t __73__SKUISignInTemplateView_prefetchResourcesForViewElement_reason_context___block_invoke(uint64_t a1, uint64_t a2)
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
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        +[SKUISignInTemplateView preferredSizeForViewElement:context:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  double v12 = *MEMORY[0x1E4F1DB30];
  double v13 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.double height = v13;
  result.double width = v12;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v10) {
        +[SKUISignInTemplateView requestLayoutForViewElement:width:context:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  char v18 = [v8 labelLayoutCache];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __68__SKUISignInTemplateView_requestLayoutForViewElement_width_context___block_invoke;
  v21[3] = &unk_1E6424DE8;
  double v24 = a4;
  id v25 = a1;
  id v22 = v8;
  id v23 = v18;
  id v19 = v18;
  id v20 = v8;
  [v9 enumerateChildrenUsingBlock:v21];
}

void __68__SKUISignInTemplateView_requestLayoutForViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v16 = a2;
  uint64_t v3 = [v16 elementType];
  if (v3 <= 119)
  {
    if (v3 != 4)
    {
      BOOL v4 = v3 == 12;
      goto LABEL_7;
    }
    BOOL v10 = SKUIActivityIndicatorView;
LABEL_14:
    [(__objc2_class *)v10 requestLayoutForViewElement:v16 width:*(void *)(a1 + 32) context:*(double *)(a1 + 48)];
LABEL_18:
    uint64_t v5 = v16;
    goto LABEL_19;
  }
  if (v3 == 120)
  {
    BOOL v10 = SKUISignInTemplateView;
    goto LABEL_14;
  }
  if (v3 == 138)
  {
    id v9 = v16;
    double v11 = (double)[*(id *)(a1 + 32) maxWidthForElement:v9 withDefaultWidth:(uint64_t)*(double *)(a1 + 48)];
    if ([*(id *)(a1 + 56) _useEditorialLayoutForLabelElement:v9])
    {
      uint64_t v12 = [*(id *)(a1 + 32) editorialLayoutForLabelElement:v9 width:v11];
      [v12 enqueueLayoutRequests];
    }
    else
    {
      uint64_t v13 = *(void **)(a1 + 56);
      uint64_t v14 = [v9 text];
      uint64_t v15 = [v9 style];
      uint64_t v12 = [v13 _attributedStringForText:v14 style:v15 context:*(void *)(a1 + 32)];

      [*(id *)(a1 + 40) requestLayoutForLabel:v9 attributedString:v12 width:(uint64_t)v11];
    }

    goto LABEL_17;
  }
  BOOL v4 = v3 == 141;
LABEL_7:
  uint64_t v5 = v16;
  if (v4)
  {
    uint64_t v6 = *(void **)(a1 + 56);
    uint64_t v7 = [v16 buttonText];
    id v8 = [v16 style];
    id v9 = [v6 _attributedStringForText:v7 style:v8 context:*(void *)(a1 + 32)];

    [*(id *)(a1 + 40) requestLayoutForButton:v16 attributedString:v9 width:(uint64_t)*(double *)(a1 + 48)];
LABEL_17:

    goto LABEL_18;
  }
LABEL_19:
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v10) {
        +[SKUISignInTemplateView sizeThatFitsWidth:viewElement:context:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  uint64_t v28 = 0;
  v29 = (double *)&v28;
  uint64_t v30 = 0x3010000000;
  v31 = &unk_1C1D0F257;
  double v32 = a3;
  uint64_t v33 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __64__SKUISignInTemplateView_sizeThatFitsWidth_viewElement_context___block_invoke;
  v23[3] = &unk_1E6427C18;
  id v26 = a1;
  double v27 = a3;
  id v18 = v9;
  id v24 = v18;
  id v25 = &v28;
  [a1 _enumerateChildrenOfViewElement:v8 usingBlock:v23];
  double v19 = v29[4];
  double v20 = v29[5];

  _Block_object_dispose(&v28, 8);
  double v21 = v19;
  double v22 = v20;
  result.double height = v22;
  result.double width = v21;
  return result;
}

double __64__SKUISignInTemplateView_sizeThatFitsWidth_viewElement_context___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void **)(a1 + 48);
  double v7 = *(double *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = a2;
  [v6 _sizeForViewElement:v9 width:v8 context:v7];
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v10
                                                              + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 40);
  [*(id *)(a1 + 48) _marginsForViewElement:v9 index:a4 width:*(void *)(a1 + 32) context:*(double *)(a1 + 56)];
  double v12 = v11;
  double v14 = v13;

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  double result = v14 + v12 + *(double *)(v15 + 40);
  *(double *)(v15 + 40) = result;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [(NSMapTable *)self->_viewElements removeAllObjects];
  [(NSMapTable *)self->_viewMargins removeAllObjects];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__SKUISignInTemplateView_reloadWithViewElement_width_context___block_invoke;
  v12[3] = &unk_1E64234F8;
  v12[4] = self;
  id v13 = v8;
  double v15 = a4;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(SKUIViewReuseView *)self modifyUsingBlock:v12];
}

void __62__SKUISignInTemplateView_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = objc_opt_class();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__SKUISignInTemplateView_reloadWithViewElement_width_context___block_invoke_2;
  v7[3] = &unk_1E6427C40;
  uint64_t v11 = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  id v9 = v3;
  uint64_t v10 = *(void *)(a1 + 32);
  id v6 = v3;
  [v4 _enumerateChildrenOfViewElement:v5 usingBlock:v7];
}

void __62__SKUISignInTemplateView_reloadWithViewElement_width_context___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v27 = a2;
  uint64_t v6 = [v27 elementType];
  if (v6 > 49)
  {
    if (v6 > 137)
    {
      if (v6 == 138)
      {
        id v12 = v27;
        double v13 = (double)[*(id *)(a1 + 32) maxWidthForElement:v12 withDefaultWidth:(uint64_t)*(double *)(a1 + 56)];
        int v14 = [(id)objc_opt_class() _useEditorialLayoutForLabelElement:v12];
        uint64_t v16 = *(void *)(a1 + 32);
        double v15 = *(void **)(a1 + 40);
        if (v14) {
          [v15 addTextViewWithElement:v12 width:v16 context:v13];
        }
        else {
        double v7 = [v15 addLabelViewWithElement:v12 width:v16 context:v13];
        }

        if (!v7) {
          goto LABEL_28;
        }
        goto LABEL_27;
      }
      if (v6 != 141) {
        goto LABEL_28;
      }
      goto LABEL_16;
    }
    if (v6 == 50)
    {
LABEL_16:
      double v7 = [*(id *)(a1 + 40) addButtonWithElement:v27 width:*(void *)(a1 + 32) context:*(double *)(a1 + 56)];
      [(SKUISignInView *)v7 addTarget:*(void *)(a1 + 48) action:sel__buttonAction_ forControlEvents:64];
      if (!v7) {
        goto LABEL_28;
      }
LABEL_27:
      [(id)objc_opt_class() _marginsForViewElement:v27 index:a4 width:*(void *)(a1 + 32) context:*(double *)(a1 + 56)];
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;
      [*(id *)(*(void *)(a1 + 48) + 424) setObject:v27 forKey:v7];
      id v25 = *(void **)(*(void *)(a1 + 48) + 432);
      id v26 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithUIEdgeInsets:", v18, v20, v22, v24);
      [v25 setObject:v26 forKey:v7];

      goto LABEL_28;
    }
    if (v6 != 120) {
      goto LABEL_28;
    }
    double v7 = objc_alloc_init(SKUISignInView);
    id v8 = [*(id *)(a1 + 48) delegate];
    [(SKUISignInView *)v7 setDelegate:v8];

    double v9 = *(double *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = (SKUIActivityIndicatorView *)v7;
  }
  else
  {
    if (v6 > 31)
    {
      if (v6 == 32)
      {
        double v7 = [*(id *)(a1 + 40) addDividerWithElement:v27 context:*(void *)(a1 + 32)];
        [(SKUISignInView *)v7 setDividerOrientation:0];
        if (v7) {
          goto LABEL_27;
        }
      }
      else if (v6 == 49)
      {
        double v7 = [*(id *)(a1 + 40) addImageViewWithElement:v27 context:*(void *)(a1 + 32)];
        if (v7) {
          goto LABEL_27;
        }
      }
      goto LABEL_28;
    }
    if (v6 != 4)
    {
      if (v6 != 12) {
        goto LABEL_28;
      }
      goto LABEL_16;
    }
    uint64_t v11 = objc_alloc_init(SKUIActivityIndicatorView);
    double v7 = (SKUISignInView *)v11;
    double v9 = *(double *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 32);
  }
  [(SKUIActivityIndicatorView *)v11 reloadWithViewElement:v27 width:v10 context:v9];
  [*(id *)(a1 + 40) addView:v7];
  if (v7) {
    goto LABEL_27;
  }
LABEL_28:
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  id v11 = v9;
  id v31 = a5;
  id v27 = v11;
  uint64_t v26 = [v11 requestIdentifier];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v12 = 424;
  obj = v10->_viewElements;
  uint64_t v13 = [(NSMapTable *)obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    int v15 = 0;
    uint64_t v16 = *(void *)v33;
    do
    {
      uint64_t v17 = 0;
      uint64_t v28 = v14;
      do
      {
        if (*(void *)v33 != v16) {
          objc_enumerationMutation(obj);
        }
        double v18 = *(void **)(*((void *)&v32 + 1) + 8 * v17);
        double v19 = [*(id *)((char *)&v10->super.super.super.super.isa + v12) objectForKey:v18];
        if (objc_opt_respondsToSelector())
        {
          v15 |= [v18 setImage:v30 forArtworkRequest:v27 context:v31];
        }
        else
        {
          uint64_t v20 = v12;
          double v21 = v10;
          double v22 = a2;
          double v23 = [v31 requestIdentifierForViewElement:v19];
          uint64_t v24 = [v23 unsignedIntegerValue];

          if (v24 == v26)
          {
            a2 = v22;
            uint64_t v10 = v21;
            uint64_t v12 = v20;
            uint64_t v14 = v28;
            if (objc_opt_respondsToSelector())
            {
              [v18 setImage:v30];
              int v15 = 1;
            }
          }
          else
          {
            a2 = v22;
            uint64_t v10 = v21;
            uint64_t v12 = v20;
            uint64_t v14 = v28;
          }
        }

        ++v17;
      }
      while (v14 != v17);
      uint64_t v14 = [(NSMapTable *)obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v14);
  }
  else
  {
    LOBYTE(v15) = 0;
  }

  return v15 & 1;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  return 0;
}

- (void)layoutSubviews
{
  v88[3] = *MEMORY[0x1E4F143B8];
  [(SKUISignInTemplateView *)self bounds];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(SKUISignInTemplateView *)self layoutMargins];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  v57 = [(SKUIViewReuseView *)self allExistingViews];
  uint64_t v82 = 0;
  v83 = (double *)&v82;
  uint64_t v84 = 0x2020000000;
  uint64_t v85 = 0;
  uint64_t v78 = 0;
  v79 = (double *)&v78;
  uint64_t v80 = 0x2020000000;
  uint64_t v81 = 0;
  uint64_t v74 = 0;
  v75 = (double *)&v74;
  uint64_t v76 = 0x2020000000;
  uint64_t v77 = 0;
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v62[1] = 3221225472;
  v62[0] = MEMORY[0x1E4F143A8];
  v62[2] = __40__SKUISignInTemplateView_layoutSubviews__block_invoke;
  v62[3] = &unk_1E6427C68;
  double v69 = v8 - v14 - v18;
  uint64_t v70 = v4;
  uint64_t v71 = v6;
  double v72 = v8;
  double v73 = v10;
  v62[4] = self;
  v66 = &v82;
  id v22 = v19;
  id v63 = v22;
  v67 = &v78;
  id v23 = v20;
  id v64 = v23;
  v68 = &v74;
  id v24 = v21;
  id v65 = v24;
  [v57 enumerateObjectsUsingBlock:v62];
  double v25 = v10 - v16 - v83[3];
  double v26 = v75[3];
  double v27 = v12 + v26;
  double v28 = v79[3];
  if (v28 <= 0.00000011920929 || v25 - v12 - v26 >= v28)
  {
    float v29 = v27 + (v25 - v27 - v28) * 0.5;
    float v30 = floorf(v29);
    if (v27 > v25 && v28 < 0.00000011920929) {
      double v25 = v27;
    }
    double v27 = v30;
  }
  else
  {
    double v25 = v27 + v28;
  }
  *(double *)v88 = v12;
  *(double *)&v88[1] = v27;
  *(double *)&v88[2] = v25;
  id v56 = v24;
  v87[0] = v56;
  id v55 = v23;
  v87[1] = v55;
  uint64_t v32 = 0;
  id v54 = v22;
  v87[2] = v54;
  double v33 = *MEMORY[0x1E4FB2848];
  double v34 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  do
  {
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v35 = (id)v87[v32];
    uint64_t v36 = [v35 countByEnumeratingWithState:&v58 objects:v86 count:16];
    if (v36)
    {
      uint64_t v37 = *(void *)v59;
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v59 != v37) {
            objc_enumerationMutation(v35);
          }
          v39 = *(void **)(*((void *)&v58 + 1) + 8 * i);
          v40 = -[NSMapTable objectForKey:](self->_viewMargins, "objectForKey:", v39, v54, v55, v56);
          v41 = v40;
          double v42 = v33;
          double v43 = v34;
          if (v40)
          {
            [v40 UIEdgeInsetsValue];
            double v42 = v44;
            double v43 = v45;
          }
          [v39 frame];
          CGFloat v47 = v46;
          CGFloat v49 = v48;
          CGFloat v51 = v50;
          CGFloat v52 = v42 + *(double *)&v88[v32];
          objc_msgSend(v39, "setFrame:", v46, v52);
          v89.origin.double x = v47;
          v89.origin.double y = v52;
          v89.size.double width = v49;
          v89.size.double height = v51;
          *(double *)&v88[v32] = v43 + CGRectGetMaxY(v89);
        }
        uint64_t v36 = [v35 countByEnumeratingWithState:&v58 objects:v86 count:16];
      }
      while (v36);
    }

    ++v32;
  }
  while (v32 != 3);
  for (uint64_t j = 2; j != -1; --j)

  _Block_object_dispose(&v74, 8);
  _Block_object_dispose(&v78, 8);
  _Block_object_dispose(&v82, 8);
}

void __40__SKUISignInTemplateView_layoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  id v20 = a2;
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 424) objectForKey:v20];
  [v20 frame];
  CGFloat v5 = v4;
  double v7 = v6;
  objc_msgSend(v20, "sizeThatFits:", *(double *)(a1 + 88), 1.79769313e308);
  v22.size.double width = v8;
  double v10 = v9;
  v22.origin.double x = v5;
  v22.origin.double y = v7;
  v22.size.double height = v10;
  +[SKUIViewElementLayoutContext itemWidthForElement:v3 withDefaultWidth:CGRectGetWidth(v22) fitWidth:*(double *)(a1 + 88)];
  double v12 = fmin(v11, *(double *)(a1 + 88));
  *(float *)&double v11 = (*(double *)(a1 + 112) - v12) * 0.5;
  objc_msgSend(v20, "setFrame:", floorf(*(float *)&v11), v7, v12, v10);
  double v13 = [*(id *)(*(void *)(a1 + 32) + 432) objectForKey:v20];
  double v14 = v13;
  if (v13)
  {
    [v13 UIEdgeInsetsValue];
    double v10 = v10 + v16 + v15;
  }
  double v17 = [v3 style];
  unint64_t v18 = [v17 elementPosition];
  if (v18 > 7) {
    goto LABEL_8;
  }
  if (((1 << v18) & 0xC5) != 0)
  {
    *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v10
                                                                + *(double *)(*(void *)(*(void *)(a1 + 80) + 8)
                                                                            + 24);
    id v19 = (id *)(a1 + 56);
    goto LABEL_9;
  }
  if (((1 << v18) & 0x32) != 0)
  {
    *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v10
                                                                + *(double *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                            + 24);
    id v19 = (id *)(a1 + 48);
  }
  else
  {
LABEL_8:
    *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v10
                                                                + *(double *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                            + 24);
    id v19 = (id *)(a1 + 40);
  }
LABEL_9:
  [*v19 addObject:v20];
}

- (void)_buttonAction:(id)a3
{
  id v3 = [(NSMapTable *)self->_viewElements objectForKey:a3];
  [v3 dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];
}

+ (id)_attributedStringForText:(id)a3 style:(id)a4 context:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  double v10 = SKUIViewElementFontWithStyle(v8);
  double v11 = [v7 tintColor];

  double v12 = SKUIViewElementPlainColorWithStyle(v8, v11);

  uint64_t v13 = [v8 textAlignment];
  double v14 = [v9 attributedStringWithDefaultFont:v10 foregroundColor:v12 textAlignment:SKUIViewElementNSTextAlignmentForIKElementAlignment(v13)];

  return v14;
}

+ (void)_enumerateChildrenOfViewElement:(id)a3 usingBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v15[3] = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__SKUISignInTemplateView__enumerateChildrenOfViewElement_usingBlock___block_invoke;
  v8[3] = &unk_1E642A110;
  id v7 = v6;
  id v9 = v7;
  double v10 = v15;
  double v11 = v14;
  double v12 = v13;
  [v5 enumerateChildrenUsingBlock:v8];

  _Block_object_dispose(v13, 8);
  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v15, 8);
}

void __69__SKUISignInTemplateView__enumerateChildrenOfViewElement_usingBlock___block_invoke(void *a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 style];
  unint64_t v4 = [v3 elementPosition];
  if (v4 > 7) {
    goto LABEL_6;
  }
  if (((1 << v4) & 0xC5) != 0)
  {

    (*(void (**)(void))(a1[4] + 16))();
    uint64_t v5 = a1[7];
    goto LABEL_7;
  }
  if (((1 << v4) & 0x32) != 0)
  {

    (*(void (**)(void))(a1[4] + 16))();
    uint64_t v5 = a1[6];
  }
  else
  {
LABEL_6:

    (*(void (**)(void))(a1[4] + 16))();
    uint64_t v5 = a1[5];
  }
LABEL_7:
  ++*(void *)(*(void *)(v5 + 8) + 24);
}

+ (UIEdgeInsets)_marginsForViewElement:(id)a3 index:(unint64_t)a4 width:(double)a5 context:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  double v11 = [v9 style];
  double v12 = [v11 valueForStyle:*MEMORY[0x1E4F6EFD0]];

  if (v12)
  {
    [v12 UIEdgeInsetsValue];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
  }
  else
  {
    double v16 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v18 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v20 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    if (a4)
    {
      id v21 = [v10 textPropertiesForViewElement:v9 width:a5];
      CGRect v22 = v21;
      if (v21)
      {
        [v21 desiredOffsetTop];
        double v14 = v23;
      }
      else
      {
        double v14 = 10.0;
      }
    }
    else
    {
      double v14 = *MEMORY[0x1E4FB2848];
    }
  }

  double v24 = v14;
  double v25 = v16;
  double v26 = v18;
  double v27 = v20;
  result.right = v27;
  result.bottom = v26;
  result.left = v25;
  result.top = v24;
  return result;
}

+ (CGSize)_sizeForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = [v7 elementType];
  if (v9 == 120)
  {
    +[SKUISignInView sizeThatFitsWidth:v7 viewElement:v8 context:a4];
LABEL_9:
    double v15 = v13;
    double v16 = v14;
    goto LABEL_10;
  }
  if (v9 != 140)
  {
    if (v9 == 138)
    {
      double v10 = (double)[v8 maxWidthForElement:v7 withDefaultWidth:(uint64_t)a4];
      double v11 = v8;
      id v12 = v7;
    }
    else
    {
      double v11 = v8;
      id v12 = v7;
      double v10 = a4;
    }
    [v11 sizeForViewElement:v12 width:v10];
    goto LABEL_9;
  }
  double v15 = *MEMORY[0x1E4F1DB30];
  double v16 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
LABEL_10:

  double v17 = v15;
  double v18 = v16;
  result.double height = v18;
  result.double width = v17;
  return result;
}

+ (BOOL)_useEditorialLayoutForLabelElement:(id)a3
{
  id v3 = a3;
  if ([v3 numberOfLines] == 1)
  {
    BOOL v4 = 0;
  }
  else
  {
    uint64_t v5 = [v3 moreButtonTitle];
    BOOL v4 = [v5 length] != 0;
  }
  return v4;
}

- (SKUISignInViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUISignInViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewMargins, 0);

  objc_storeStrong((id *)&self->_viewElements, 0);
}

- (void)initWithFrame:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)prefetchResourcesForViewElement:(uint64_t)a3 reason:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)preferredSizeForViewElement:(uint64_t)a3 context:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)requestLayoutForViewElement:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)sizeThatFitsWidth:(uint64_t)a3 viewElement:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end