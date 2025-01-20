@interface SKUIButtonCollectionViewCell
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

@implementation SKUIButtonCollectionViewCell

- (void)dealloc
{
  [(UIControl *)self->_button removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
  v3.receiver = self;
  v3.super_class = (Class)SKUIButtonCollectionViewCell;
  [(SKUIViewReuseCollectionViewCell *)&v3 dealloc];
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
        +[SKUIButtonCollectionViewCell prefetchResourcesForViewElement:reason:context:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  char v17 = [v8 prefetchResourcesForViewElement:v7 reason:a4];

  return v17;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v8) {
        +[SKUIButtonCollectionViewCell preferredSizeForViewElement:context:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  [v6 defaultItemWidthForViewElement:v7];
  objc_msgSend(a1, "sizeThatFitsWidth:viewElement:context:", v7, v6);
  double v17 = v16;
  double v19 = v18;

  double v20 = v17;
  double v21 = v19;
  result.height = v21;
  result.width = v20;
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
        +[SKUIButtonCollectionViewCell requestLayoutForViewElement:width:context:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  uint64_t v18 = [v8 elementType];
  if (v18 == 141 || v18 == 12)
  {
    double v19 = [a1 _attributedStringWithButton:v8 context:v9];
    double v20 = [v9 labelLayoutCache];
    [v20 requestLayoutForButton:v8 attributedString:v19 width:(uint64_t)a4];
  }
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
        +[SKUIButtonCollectionViewCell sizeThatFitsWidth:viewElement:context:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  [v8 sizeForViewElement:v7 width:a3];
  double v18 = v17;

  double v19 = a3;
  double v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v11 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v11) {
        -[SKUIButtonCollectionViewCell reloadWithViewElement:width:context:](v11, v12, v13, v14, v15, v16, v17, v18);
      }
    }
  }
  uint64_t v29 = MEMORY[0x1E4F143A8];
  uint64_t v30 = 3221225472;
  v31 = __68__SKUIButtonCollectionViewCell_reloadWithViewElement_width_context___block_invoke;
  v32 = &unk_1E64234F8;
  id v19 = v9;
  id v33 = v19;
  v34 = self;
  double v36 = a4;
  id v20 = v10;
  id v35 = v20;
  [(SKUIViewReuseCollectionViewCell *)self modifyUsingBlock:&v29];
  double v21 = objc_msgSend(v20, "imageResourceCacheKeyForViewElement:", v19, v29, v30, v31, v32);
  id buttonImageResourceCacheKey = self->_buttonImageResourceCacheKey;
  self->_id buttonImageResourceCacheKey = v21;

  v23 = [v19 style];
  viewElementStyle = self->_viewElementStyle;
  self->_viewElementStyle = v23;

  v25 = [v19 buyButtonDescriptor];
  buyButtonDescriptor = self->_buyButtonDescriptor;
  self->_buyButtonDescriptor = v25;

  objc_storeStrong((id *)&self->_viewElement, a3);
  if ([(SKUIButtonCollectionViewCell *)self _usesBackgroundWithAlpha])
  {
    button = self->_button;
    if (button)
    {
      v28 = [MEMORY[0x1E4FB1618] clearColor];
      [(UIControl *)button setBackgroundColor:v28];
    }
  }
}

void __68__SKUIButtonCollectionViewCell_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) elementType];
  if (v3 == 12 || v3 == 141 || v3 == 50)
  {
    uint64_t v4 = [v7 addButtonWithElement:*(void *)(a1 + 32) width:*(void *)(a1 + 48) context:*(double *)(a1 + 56)];
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = *(void **)(v5 + 816);
    *(void *)(v5 + 816) = v4;

    [*(id *)(*(void *)(a1 + 40) + 816) addTarget:*(void *)(a1 + 40) action:sel__buttonAction_ forControlEvents:64];
  }
}

- (void)setBackgroundColor:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIButtonCollectionViewCell setBackgroundColor:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUIButtonCollectionViewCell;
  [(SKUIViewReuseCollectionViewCell *)&v15 setBackgroundColor:v4];
  if ([(SKUIButtonCollectionViewCell *)self _usesBackgroundWithAlpha])
  {
    button = self->_button;
    if (button)
    {
      uint64_t v14 = [MEMORY[0x1E4FB1618] clearColor];
      [(UIControl *)button setBackgroundColor:v14];
    }
  }
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v11 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v11) {
        -[SKUIButtonCollectionViewCell setImage:forArtworkRequest:context:](v11, v12, v13, v14, v15, v16, v17, v18);
      }
    }
  }
  id v19 = [v10 requestIdentifierForResourceCacheKey:self->_buttonImageResourceCacheKey];
  if (v19 && (uint64_t v20 = [v9 requestIdentifier], v20 == objc_msgSend(v19, "unsignedIntegerValue")))
  {
    double v21 = [(UIControl *)self->_button imageView];
    [v21 setImage:v8];

    BOOL v22 = 1;
  }
  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v10) {
        -[SKUIButtonCollectionViewCell updateWithItemState:context:animated:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  BOOL v18 = [(SKUIBuyButtonDescriptor *)self->_buyButtonDescriptor canPersonalizeUsingItemState:v8];
  if (v18)
  {
    button = self->_button;
    buyButtonDescriptor = self->_buyButtonDescriptor;
    double v21 = [v9 clientContext];
    [(UIControl *)button setValuesUsingBuyButtonDescriptor:buyButtonDescriptor itemState:v8 clientContext:v21 animated:v5];
  }
  return v18;
}

- (id)viewForElementIdentifier:(id)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        -[SKUIButtonCollectionViewCell viewForElementIdentifier:](v3, v4, v5, v6, v7, v8, v9, v10);
      }
    }
  }
  return 0;
}

- (void)layoutSubviews
{
}

- (void)_buttonAction:(id)a3
{
  SKUICollectionViewForView(self);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v8 delegate];
  char v5 = objc_opt_respondsToSelector();
  viewElement = self->_viewElement;
  if (v5)
  {
    uint64_t v7 = [v8 indexPathForCell:self];
    [v4 collectionView:v8 didConfirmButtonElement:viewElement withClickInfo:0 forItemAtIndexPath:v7];
  }
  else
  {
    [(SKUIButtonViewElement *)self->_viewElement dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];
  }
}

+ (id)_attributedStringWithButton:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 buttonTitleStyle];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [v5 style];
  }
  uint64_t v10 = v9;

  uint64_t v11 = SKUIViewElementFontWithStyle(v10);
  if (!v11)
  {
    uint64_t v11 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  }
  uint64_t v12 = [v6 tintColor];
  uint64_t v13 = SKUIViewElementPlainColorWithStyle(v10, v12);

  if (!v13)
  {
    uint64_t v13 = [MEMORY[0x1E4FB1618] blackColor];
  }
  uint64_t v14 = SKUIViewElementAlignmentForStyle(v10);
  if (v14) {
    uint64_t v15 = SKUIViewElementNSTextAlignmentForIKElementAlignment(v14);
  }
  else {
    uint64_t v15 = 0;
  }
  uint64_t v16 = [v5 buttonText];
  uint64_t v17 = [v16 attributedStringWithDefaultFont:v11 foregroundColor:v13 textAlignment:v15 style:v10];

  return v17;
}

- (BOOL)_usesBackgroundWithAlpha
{
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  double v5 = 0.0;
  uint64_t v6 = 0;
  v2 = [(SKUIButtonCollectionViewCell *)self backgroundColor];
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

- (void)reloadWithViewElement:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setBackgroundColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setImage:(uint64_t)a3 forArtworkRequest:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)updateWithItemState:(uint64_t)a3 context:(uint64_t)a4 animated:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)viewForElementIdentifier:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end