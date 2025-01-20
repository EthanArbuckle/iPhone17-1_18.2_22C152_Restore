@interface SUUIButtonCollectionViewCell
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (id)_attributedStringWithButton:(id)a3 context:(id)a4;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)_usesBackgroundWithAlpha;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (id)viewForElementIdentifier:(id)a3;
- (void)_buttonAction:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (void)setBackgroundColor:(id)a3;
@end

@implementation SUUIButtonCollectionViewCell

- (void)dealloc
{
  [(UIControl *)self->_button removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
  v3.receiver = self;
  v3.super_class = (Class)SUUIButtonCollectionViewCell;
  [(SUUIViewReuseCollectionViewCell *)&v3 dealloc];
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return [a5 prefetchResourcesForViewElement:a3 reason:a4];
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v6 defaultItemWidthForViewElement:v7];
  objc_msgSend(a1, "sizeThatFitsWidth:viewElement:context:", v7, v6);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  uint64_t v9 = [v12 elementType];
  if (v9 == 141 || v9 == 12)
  {
    double v10 = [a1 _attributedStringWithButton:v12 context:v8];
    double v11 = [v8 labelLayoutCache];
    [v11 requestLayoutForButton:v12 attributedString:v10 width:(uint64_t)a4];
  }
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  objc_msgSend(a5, "sizeForViewElement:width:", a4);
  double v7 = a3;
  result.height = v6;
  result.width = v7;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  uint64_t v21 = MEMORY[0x263EF8330];
  uint64_t v22 = 3221225472;
  v23 = __68__SUUIButtonCollectionViewCell_reloadWithViewElement_width_context___block_invoke;
  v24 = &unk_265400C88;
  id v11 = v9;
  id v25 = v11;
  v26 = self;
  double v28 = a4;
  id v12 = v10;
  id v27 = v12;
  [(SUUIViewReuseCollectionViewCell *)self modifyUsingBlock:&v21];
  double v13 = objc_msgSend(v12, "imageResourceCacheKeyForViewElement:", v11, v21, v22, v23, v24);
  id buttonImageResourceCacheKey = self->_buttonImageResourceCacheKey;
  self->_id buttonImageResourceCacheKey = v13;

  v15 = [v11 style];
  viewElementStyle = self->_viewElementStyle;
  self->_viewElementStyle = v15;

  v17 = [v11 buyButtonDescriptor];
  buyButtonDescriptor = self->_buyButtonDescriptor;
  self->_buyButtonDescriptor = v17;

  objc_storeStrong((id *)&self->_viewElement, a3);
  if ([(SUUIButtonCollectionViewCell *)self _usesBackgroundWithAlpha])
  {
    button = self->_button;
    if (button)
    {
      v20 = [MEMORY[0x263F825C8] clearColor];
      [(UIControl *)button setBackgroundColor:v20];
    }
  }
}

void __68__SUUIButtonCollectionViewCell_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) elementType];
  if (v3 == 12 || v3 == 141 || v3 == 50)
  {
    uint64_t v4 = [v7 addButtonWithElement:*(void *)(a1 + 32) width:*(void *)(a1 + 48) context:*(double *)(a1 + 56)];
    uint64_t v5 = *(void *)(a1 + 40);
    double v6 = *(void **)(v5 + 816);
    *(void *)(v5 + 816) = v4;

    [*(id *)(*(void *)(a1 + 40) + 816) addTarget:*(void *)(a1 + 40) action:sel__buttonAction_ forControlEvents:64];
  }
}

- (void)setBackgroundColor:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUUIButtonCollectionViewCell;
  [(SUUIViewReuseCollectionViewCell *)&v6 setBackgroundColor:a3];
  if ([(SUUIButtonCollectionViewCell *)self _usesBackgroundWithAlpha])
  {
    button = self->_button;
    if (button)
    {
      uint64_t v5 = [MEMORY[0x263F825C8] clearColor];
      [(UIControl *)button setBackgroundColor:v5];
    }
  }
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [a5 requestIdentifierForResourceCacheKey:self->_buttonImageResourceCacheKey];
  if (v10 && (uint64_t v11 = [v9 requestIdentifier], v11 == objc_msgSend(v10, "unsignedIntegerValue")))
  {
    id v12 = [(UIControl *)self->_button imageView];
    [v12 setImage:v8];

    BOOL v13 = 1;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [(SUUIBuyButtonDescriptor *)self->_buyButtonDescriptor canPersonalizeUsingItemState:v8];
  if (v10)
  {
    button = self->_button;
    buyButtonDescriptor = self->_buyButtonDescriptor;
    BOOL v13 = [v9 clientContext];
    [(UIControl *)button setValuesUsingBuyButtonDescriptor:buyButtonDescriptor itemState:v8 clientContext:v13 animated:v5];
  }
  return v10;
}

- (id)viewForElementIdentifier:(id)a3
{
  return 0;
}

- (void)layoutSubviews
{
  v25.receiver = self;
  v25.super_class = (Class)SUUIButtonCollectionViewCell;
  [(SUUICollectionViewCell *)&v25 layoutSubviews];
  if (self->_button)
  {
    uint64_t v3 = [(SUUIButtonCollectionViewCell *)self contentView];
    [v3 bounds];
    double v5 = v4;
    double v7 = v6;

    [(SUUIViewReuseCollectionViewCell *)self contentInset];
    double v9 = v8;
    double v11 = v10;
    double v12 = v5 - v8 - v10;
    BOOL v13 = self->_viewElementStyle;
    unint64_t v14 = [(IKViewElementStyle *)v13 textAlignment];
    if (!v14) {
      unint64_t v14 = [(IKViewElementStyle *)v13 elementAlignment];
    }
    double v15 = *MEMORY[0x263F001A8];
    CGFloat v16 = *(double *)(MEMORY[0x263F001A8] + 8);
    -[UIControl sizeThatFits:](self->_button, "sizeThatFits:", v12, 1.79769313e308);
    v26.size.width = v17;
    double v19 = v18;
    v26.origin.x = v15;
    v26.origin.y = v16;
    v26.size.height = v19;
    +[SUUIViewElementLayoutContext itemWidthForElement:self->_viewElement withDefaultWidth:CGRectGetWidth(v26) fitWidth:v12];
    if (v20 >= v12) {
      double v21 = v12;
    }
    else {
      double v21 = v20;
    }
    float v22 = (v7 - v19) * 0.5;
    double v23 = floorf(v22);
    if (v14 <= 5)
    {
      if (((1 << v14) & 0x35) != 0)
      {
        float v24 = (v5 - v21) * 0.5;
        double v15 = floorf(v24);
      }
      else if (v14 == 1)
      {
        double v15 = v9;
      }
      else
      {
        double v15 = v5 - v11 - v21;
      }
    }
    -[UIControl setFrame:](self->_button, "setFrame:", v15, v23);
  }
}

- (void)_buttonAction:(id)a3
{
  SUUICollectionViewForView(self);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  double v4 = [v8 delegate];
  char v5 = objc_opt_respondsToSelector();
  viewElement = self->_viewElement;
  if (v5)
  {
    double v7 = [v8 indexPathForCell:self];
    [v4 collectionView:v8 didConfirmButtonElement:viewElement withClickInfo:0 forItemAtIndexPath:v7];
  }
  else
  {
    [(SUUIButtonViewElement *)self->_viewElement dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];
  }
}

+ (id)_attributedStringWithButton:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = [v5 buttonTitleStyle];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [v5 style];
  }
  double v10 = v9;

  double v11 = SUUIViewElementFontWithStyle(v10);
  if (!v11)
  {
    double v11 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
  }
  double v12 = [v6 tintColor];
  BOOL v13 = SUUIViewElementPlainColorWithStyle(v10, v12);

  if (!v13)
  {
    BOOL v13 = [MEMORY[0x263F825C8] blackColor];
  }
  uint64_t v14 = SUUIViewElementAlignmentForStyle(v10);
  if (v14) {
    uint64_t v15 = SUUIViewElementNSTextAlignmentForIKElementAlignment(v14);
  }
  else {
    uint64_t v15 = 0;
  }
  CGFloat v16 = [v5 buttonText];
  CGFloat v17 = [v16 attributedStringWithDefaultFont:v11 foregroundColor:v13 textAlignment:v15 style:v10];

  return v17;
}

- (BOOL)_usesBackgroundWithAlpha
{
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  double v5 = 0.0;
  uint64_t v6 = 0;
  v2 = [(SUUIButtonCollectionViewCell *)self backgroundColor];
  int v3 = [v2 getHue:&v8 saturation:&v7 brightness:&v6 alpha:&v5];

  return v3 && v5 < 1.0 && v5 != 0.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElementStyle, 0);
  objc_storeStrong((id *)&self->_viewElement, 0);
  objc_storeStrong((id *)&self->_buyButtonDescriptor, 0);
  objc_storeStrong(&self->_buttonImageResourceCacheKey, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end