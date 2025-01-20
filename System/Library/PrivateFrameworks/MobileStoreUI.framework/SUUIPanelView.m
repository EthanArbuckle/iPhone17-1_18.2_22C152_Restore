@interface SUUIPanelView
+ (BOOL)_isValidTextInputViewElement:(id)a3;
+ (BOOL)_shouldDisplayViewElement:(id)a3;
+ (BOOL)_useEditorialLayoutForLabelElement:(id)a3;
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)_sizeForViewElement:(id)a3 width:(double)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (UIEdgeInsets)_marginsForViewElement:(id)a3 index:(unint64_t)a4 width:(double)a5 context:(id)a6;
+ (id)_attributedStringForText:(id)a3 style:(id)a4 context:(id)a5;
+ (void)_enumerateChildrenOfViewElement:(id)a3 usingBlock:(id)a4;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)resignFirstResponder;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (SUUIPanelView)initWithFrame:(CGRect)a3;
- (id)viewForElementIdentifier:(id)a3;
- (void)_buttonAction:(id)a3;
- (void)animatorFeature:(id)a3 performAnimationWithName:(id)a4 options:(id)a5;
- (void)dealloc;
- (void)layoutSubviews;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
@end

@implementation SUUIPanelView

- (SUUIPanelView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SUUIPanelView;
  v3 = -[SUUIViewReuseView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:0 valueOptions:0 capacity:0];
    animators = v3->_animators;
    v3->_animators = (NSMapTable *)v4;

    uint64_t v6 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:0 valueOptions:0 capacity:0];
    viewElements = v3->_viewElements;
    v3->_viewElements = (NSMapTable *)v6;

    uint64_t v8 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:0 valueOptions:0 capacity:0];
    viewMargins = v3->_viewMargins;
    v3->_viewMargins = (NSMapTable *)v8;
  }
  return v3;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_animators;
  uint64_t v4 = [(NSMapTable *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) setDelegate:0];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMapTable *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)SUUIPanelView;
  [(SUUIViewReuseView *)&v8 dealloc];
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __64__SUUIPanelView_prefetchResourcesForViewElement_reason_context___block_invoke;
  v11[3] = &unk_265400BE8;
  id v9 = v8;
  v13 = &v15;
  int64_t v14 = a4;
  id v12 = v9;
  [v7 enumerateChildrenUsingBlock:v11];
  LOBYTE(a4) = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return a4;
}

uint64_t __64__SUUIPanelView_prefetchResourcesForViewElement_reason_context___block_invoke(uint64_t a1, uint64_t a2)
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
  double v4 = *MEMORY[0x263F001B0];
  double v5 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  long long v10 = [v8 labelLayoutCache];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __59__SUUIPanelView_requestLayoutForViewElement_width_context___block_invoke;
  v13[3] = &unk_265400C10;
  double v16 = a4;
  id v17 = a1;
  id v14 = v8;
  id v15 = v10;
  id v11 = v10;
  id v12 = v8;
  [v9 enumerateChildrenUsingBlock:v13];
}

uint64_t __59__SUUIPanelView_requestLayoutForViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v16 = a2;
  uint64_t v3 = [v16 elementType];
  if (v3 <= 137)
  {
    if (v3 != 4)
    {
      double v4 = v16;
      if (v3 != 12) {
        goto LABEL_19;
      }
      goto LABEL_8;
    }
    id v11 = SUUIActivityIndicatorView;
LABEL_14:
    uint64_t v3 = [(__objc2_class *)v11 requestLayoutForViewElement:v16 width:*(void *)(a1 + 32) context:*(double *)(a1 + 48)];
LABEL_18:
    double v4 = v16;
    goto LABEL_19;
  }
  if (v3 == 138)
  {
    id v8 = v16;
    double v9 = (double)[*(id *)(a1 + 32) maxWidthForElement:v8 withDefaultWidth:(uint64_t)*(double *)(a1 + 48)];
    if ([*(id *)(a1 + 56) _useEditorialLayoutForLabelElement:v8])
    {
      long long v10 = [*(id *)(a1 + 32) editorialLayoutForLabelElement:v8 width:v9];
      [v10 enqueueLayoutRequests];
    }
    else
    {
      id v12 = *(void **)(a1 + 56);
      v13 = [v8 text];
      id v14 = [v8 style];
      long long v10 = [v12 _attributedStringForText:v13 style:v14 context:*(void *)(a1 + 32)];

      [*(id *)(a1 + 40) requestLayoutForLabel:v8 attributedString:v10 width:(uint64_t)v9];
    }

    goto LABEL_17;
  }
  double v4 = v16;
  if (v3 == 140)
  {
    uint64_t v3 = [*(id *)(a1 + 56) _isValidTextInputViewElement:v16];
    double v4 = v16;
    if (!v3) {
      goto LABEL_19;
    }
    id v11 = SUUIPINInputControl;
    goto LABEL_14;
  }
  if (v3 == 141)
  {
LABEL_8:
    double v5 = *(void **)(a1 + 56);
    uint64_t v6 = [v4 buttonText];
    id v7 = [v16 style];
    id v8 = [v5 _attributedStringForText:v6 style:v7 context:*(void *)(a1 + 32)];

    [*(id *)(a1 + 40) requestLayoutForButton:v16 attributedString:v8 width:(uint64_t)*(double *)(a1 + 48)];
LABEL_17:

    goto LABEL_18;
  }
LABEL_19:
  return MEMORY[0x270F9A758](v3, v4);
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v20 = 0;
  v21 = (double *)&v20;
  uint64_t v22 = 0x3010000000;
  v23 = "";
  double v24 = a3;
  uint64_t v25 = 0;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __55__SUUIPanelView_sizeThatFitsWidth_viewElement_context___block_invoke;
  v15[3] = &unk_2654076F8;
  id v18 = a1;
  double v19 = a3;
  id v10 = v9;
  id v16 = v10;
  id v17 = &v20;
  [a1 _enumerateChildrenOfViewElement:v8 usingBlock:v15];
  double v11 = v21[4];
  double v12 = v21[5];

  _Block_object_dispose(&v20, 8);
  double v13 = v11;
  double v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

double __55__SUUIPanelView_sizeThatFitsWidth_viewElement_context___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
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
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  double v10 = self->_animators;
  uint64_t v11 = [(NSMapTable *)v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v22 + 1) + 8 * v14++) setDelegate:0];
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMapTable *)v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v12);
  }

  inputResponder = self->_inputResponder;
  self->_inputResponder = 0;

  [(NSMapTable *)self->_animators removeAllObjects];
  [(NSMapTable *)self->_viewElements removeAllObjects];
  [(NSMapTable *)self->_viewMargins removeAllObjects];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __53__SUUIPanelView_reloadWithViewElement_width_context___block_invoke;
  v18[3] = &unk_265400C88;
  v18[4] = self;
  id v19 = v8;
  double v21 = a4;
  id v20 = v9;
  id v16 = v9;
  id v17 = v8;
  [(SUUIViewReuseView *)self modifyUsingBlock:v18];
}

void __53__SUUIPanelView_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = objc_opt_class();
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__SUUIPanelView_reloadWithViewElement_width_context___block_invoke_2;
  v7[3] = &unk_265407720;
  uint64_t v11 = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  id v9 = v3;
  uint64_t v10 = *(void *)(a1 + 32);
  id v6 = v3;
  [v4 _enumerateChildrenOfViewElement:v5 usingBlock:v7];
}

void __53__SUUIPanelView_reloadWithViewElement_width_context___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v26 = a2;
  uint64_t v6 = [v26 elementType];
  if (v6 > 49)
  {
    if (v6 > 139)
    {
      if (v6 == 140)
      {
        id v7 = v26;
        if ([(id)objc_opt_class() _isValidTextInputViewElement:v7])
        {
          uint64_t v13 = objc_alloc_init(SUUIPINInputControl);
          [(SUUIPINInputControl *)v13 reloadWithViewElement:v7 width:*(void *)(a1 + 32) context:*(double *)(a1 + 56)];
          [*(id *)(a1 + 40) addView:v13];
          objc_storeStrong((id *)(*(void *)(a1 + 48) + 432), v13);
          uint64_t v12 = v13;
          uint64_t v14 = [v7 animationInterface];
          uint64_t v15 = v14;
          if (v14)
          {
            [v14 setDelegate:*(void *)(a1 + 48)];
            [*(id *)(*(void *)(a1 + 48) + 424) setObject:v12 forKey:v15];
          }
        }
        else
        {
          uint64_t v12 = 0;
        }
LABEL_26:

        goto LABEL_27;
      }
      if (v6 != 141) {
        goto LABEL_29;
      }
    }
    else if (v6 != 50)
    {
      if (v6 != 138) {
        goto LABEL_29;
      }
      id v7 = v26;
      double v8 = (double)[*(id *)(a1 + 32) maxWidthForElement:v7 withDefaultWidth:(uint64_t)*(double *)(a1 + 56)];
      int v9 = [(id)objc_opt_class() _useEditorialLayoutForLabelElement:v7];
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v10 = *(void **)(a1 + 40);
      if (v9) {
        [v10 addTextViewWithElement:v7 width:v11 context:v8];
      }
      else {
      uint64_t v12 = [v10 addLabelViewWithElement:v7 width:v11 context:v8];
      }
      goto LABEL_26;
    }
LABEL_16:
    uint64_t v12 = [*(id *)(a1 + 40) addButtonWithElement:v26 width:*(void *)(a1 + 32) context:*(double *)(a1 + 56)];
    [(SUUIActivityIndicatorView *)v12 addTarget:*(void *)(a1 + 48) action:sel__buttonAction_ forControlEvents:64];
    goto LABEL_27;
  }
  if (v6 > 31)
  {
    if (v6 == 32)
    {
      uint64_t v12 = [*(id *)(a1 + 40) addDividerWithElement:v26 context:*(void *)(a1 + 32)];
      [(SUUIActivityIndicatorView *)v12 setDividerOrientation:0];
    }
    else
    {
      if (v6 != 49) {
        goto LABEL_29;
      }
      uint64_t v12 = [*(id *)(a1 + 40) addImageViewWithElement:v26 context:*(void *)(a1 + 32)];
    }
    goto LABEL_27;
  }
  if (v6 != 4)
  {
    if (v6 != 12) {
      goto LABEL_29;
    }
    goto LABEL_16;
  }
  uint64_t v12 = objc_alloc_init(SUUIActivityIndicatorView);
  [(SUUIActivityIndicatorView *)v12 reloadWithViewElement:v26 width:*(void *)(a1 + 32) context:*(double *)(a1 + 56)];
  [*(id *)(a1 + 40) addView:v12];
LABEL_27:
  if (v12)
  {
    [(id)objc_opt_class() _marginsForViewElement:v26 index:a4 width:*(void *)(a1 + 32) context:*(double *)(a1 + 56)];
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    [*(id *)(*(void *)(a1 + 48) + 440) setObject:v26 forKey:v12];
    long long v24 = *(void **)(*(void *)(a1 + 48) + 448);
    long long v25 = objc_msgSend(MEMORY[0x263F08D40], "valueWithUIEdgeInsets:", v17, v19, v21, v23);
    [v24 setObject:v25 forKey:v12];
  }
LABEL_29:
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v30 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  id v11 = v9;
  id v31 = a5;
  uint64_t v27 = v11;
  uint64_t v26 = [v11 requestIdentifier];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v12 = 440;
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

- (BOOL)becomeFirstResponder
{
  if (self->_inputResponder)
  {
    inputResponder = self->_inputResponder;
    return [(UIResponder *)inputResponder becomeFirstResponder];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SUUIPanelView;
    return [(SUUIPanelView *)&v4 becomeFirstResponder];
  }
}

- (BOOL)canBecomeFirstResponder
{
  if (self->_inputResponder)
  {
    inputResponder = self->_inputResponder;
    return [(UIResponder *)inputResponder canBecomeFirstResponder];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SUUIPanelView;
    return [(SUUIPanelView *)&v4 canBecomeFirstResponder];
  }
}

- (BOOL)resignFirstResponder
{
  if (self->_inputResponder)
  {
    inputResponder = self->_inputResponder;
    return [(UIResponder *)inputResponder resignFirstResponder];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SUUIPanelView;
    return [(SUUIPanelView *)&v4 resignFirstResponder];
  }
}

- (void)layoutSubviews
{
  v88[3] = *MEMORY[0x263EF8340];
  [(SUUIPanelView *)self bounds];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(SUUIPanelView *)self layoutMargins];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  v57 = [(SUUIViewReuseView *)self allExistingViews];
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
  id v19 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v20 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v21 = objc_alloc_init(MEMORY[0x263EFF980]);
  v62[1] = 3221225472;
  v62[0] = MEMORY[0x263EF8330];
  v62[2] = __31__SUUIPanelView_layoutSubviews__block_invoke;
  v62[3] = &unk_265407748;
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
  double v33 = *MEMORY[0x263F834E8];
  double v34 = *(double *)(MEMORY[0x263F834E8] + 16);
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
          v89.origin.x = v47;
          v89.origin.y = v52;
          v89.size.width = v49;
          v89.size.height = v51;
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

void __31__SUUIPanelView_layoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  id v20 = a2;
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 440) objectForKey:v20];
  [v20 frame];
  CGFloat v5 = v4;
  double v7 = v6;
  objc_msgSend(v20, "sizeThatFits:", *(double *)(a1 + 88), 1.79769313e308);
  v22.size.width = v8;
  double v10 = v9;
  v22.origin.x = v5;
  v22.origin.y = v7;
  v22.size.height = v10;
  +[SUUIViewElementLayoutContext itemWidthForElement:v3 withDefaultWidth:CGRectGetWidth(v22) fitWidth:*(double *)(a1 + 88)];
  double v12 = fmin(v11, *(double *)(a1 + 88));
  *(float *)&double v11 = (*(double *)(a1 + 112) - v12) * 0.5;
  objc_msgSend(v20, "setFrame:", floorf(*(float *)&v11), v7, v12, v10);
  double v13 = [*(id *)(*(void *)(a1 + 32) + 448) objectForKey:v20];
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

- (void)animatorFeature:(id)a3 performAnimationWithName:(id)a4 options:(id)a5
{
  id v11 = a4;
  id v8 = a5;
  double v9 = [(NSMapTable *)self->_animators objectForKey:a3];
  if ([v9 isDescendantOfView:self]
    && [v11 isEqualToString:0x270508D30])
  {
    double v10 = [[SUUIShakeAnimation alloc] initWithOptions:v8];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SUUIShakeAnimation *)v10 animatePINInputControl:v9];
    }
    else {
      [(SUUIShakeAnimation *)v10 animateView:v9];
    }
  }
}

+ (id)_attributedStringForText:(id)a3 style:(id)a4 context:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  double v10 = SUUIViewElementFontWithStyle(v8);
  id v11 = [v7 tintColor];

  double v12 = SUUIViewElementPlainColorWithStyle(v8, v11);

  uint64_t v13 = [v8 textAlignment];
  double v14 = [v9 attributedStringWithDefaultFont:v10 foregroundColor:v12 textAlignment:SUUIViewElementNSTextAlignmentForIKElementAlignment(v13)];

  return v14;
}

+ (void)_enumerateChildrenOfViewElement:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v17[3] = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v15[3] = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__SUUIPanelView__enumerateChildrenOfViewElement_usingBlock___block_invoke;
  v9[3] = &unk_265408770;
  id v14 = a1;
  id v8 = v7;
  id v10 = v8;
  id v11 = v17;
  double v12 = v16;
  uint64_t v13 = v15;
  [v6 enumerateChildrenUsingBlock:v9];

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v16, 8);
  _Block_object_dispose(v17, 8);
}

uint64_t __60__SUUIPanelView__enumerateChildrenOfViewElement_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = [*(id *)(a1 + 64) _shouldDisplayViewElement:v9];
  id v4 = v9;
  if (v3)
  {
    CGFloat v5 = [v9 style];
    unint64_t v6 = [v5 elementPosition];
    if (v6 <= 7)
    {
      if (((1 << v6) & 0xC5) != 0)
      {

        uint64_t v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
        uint64_t v7 = *(void *)(a1 + 56);
LABEL_8:
        ++*(void *)(*(void *)(v7 + 8) + 24);
        id v4 = v9;
        goto LABEL_9;
      }
      if (((1 << v6) & 0x32) != 0)
      {

        uint64_t v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
        uint64_t v7 = *(void *)(a1 + 48);
        goto LABEL_8;
      }
    }

    uint64_t v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
    uint64_t v7 = *(void *)(a1 + 40);
    goto LABEL_8;
  }
LABEL_9:
  return MEMORY[0x270F9A758](v3, v4);
}

+ (BOOL)_isValidTextInputViewElement:(id)a3
{
  id v3 = a3;
  id v4 = [v3 style];
  CGFloat v5 = [v4 textStyle];

  uint64_t v6 = [v3 maximumLength];
  if (v6 < 1) {
    char v7 = 0;
  }
  else {
    char v7 = [v5 isEqualToString:0x2704FE150];
  }

  return v7;
}

+ (UIEdgeInsets)_marginsForViewElement:(id)a3 index:(unint64_t)a4 width:(double)a5 context:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = [v9 style];
  double v12 = [v11 valueForStyle:*MEMORY[0x263F4B388]];

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
    double v16 = *(double *)(MEMORY[0x263F834E8] + 8);
    double v18 = *(double *)(MEMORY[0x263F834E8] + 16);
    double v20 = *(double *)(MEMORY[0x263F834E8] + 24);
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
      double v14 = *MEMORY[0x263F834E8];
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

+ (BOOL)_shouldDisplayViewElement:(id)a3
{
  return [a3 elementType] != 7;
}

+ (CGSize)_sizeForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = [v7 elementType];
  if (v9 == 140)
  {
    double v13 = *MEMORY[0x263F001B0];
    double v14 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  else
  {
    if (v9 == 138)
    {
      double v10 = (double)[v8 maxWidthForElement:v7 withDefaultWidth:(uint64_t)a4];
      id v11 = v8;
      id v12 = v7;
    }
    else
    {
      id v11 = v8;
      id v12 = v7;
      double v10 = a4;
    }
    [v11 sizeForViewElement:v12 width:v10];
    double v13 = v15;
    double v14 = v16;
  }

  double v17 = v13;
  double v18 = v14;
  result.height = v18;
  result.width = v17;
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
    CGFloat v5 = [v3 moreButtonTitle];
    BOOL v4 = [v5 length] != 0;
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewMargins, 0);
  objc_storeStrong((id *)&self->_viewElements, 0);
  objc_storeStrong((id *)&self->_inputResponder, 0);
  objc_storeStrong((id *)&self->_animators, 0);
}

@end