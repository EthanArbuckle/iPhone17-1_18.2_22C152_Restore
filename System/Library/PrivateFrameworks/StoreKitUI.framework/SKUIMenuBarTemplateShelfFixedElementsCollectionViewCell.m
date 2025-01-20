@interface SKUIMenuBarTemplateShelfFixedElementsCollectionViewCell
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (id)_attributedStringForButton:(id)a3 context:(id)a4;
+ (id)_attributedStringForLabel:(id)a3 context:(id)a4;
+ (id)_leftPositionedChildrenOfViewElement:(id)a3;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (SKUIMenuBarTemplateShelfFixedElementsCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)viewForElementIdentifier:(id)a3;
- (void)layoutSubviews;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (void)setContentInset:(UIEdgeInsets)a3;
@end

@implementation SKUIMenuBarTemplateShelfFixedElementsCollectionViewCell

- (SKUIMenuBarTemplateShelfFixedElementsCollectionViewCell)initWithFrame:(CGRect)a3
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
        -[SKUIMenuBarTemplateShelfFixedElementsCollectionViewCell initWithFrame:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)SKUIMenuBarTemplateShelfFixedElementsCollectionViewCell;
  v16 = -[SKUIViewReuseCollectionViewCell initWithFrame:](&v20, sel_initWithFrame_, x, y, width, height);
  if (v16)
  {
    uint64_t v17 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0 capacity:0];
    viewElementViews = v16->_viewElementViews;
    v16->_viewElementViews = (NSMapTable *)v17;
  }
  return v16;
}

- (void)layoutSubviews
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v30.receiver = self;
  v30.super_class = (Class)SKUIMenuBarTemplateShelfFixedElementsCollectionViewCell;
  [(SKUICollectionViewCell *)&v30 layoutSubviews];
  v3 = [(SKUIMenuBarTemplateShelfFixedElementsCollectionViewCell *)self contentView];
  [v3 bounds];
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double v7 = v6 + left;
  double v9 = v8 + top;
  double v11 = v10 - (left + self->_contentInset.right);
  double v13 = v12 - (top + self->_contentInset.bottom);

  v33.origin.double x = v7;
  v33.origin.double y = v9;
  v33.size.double width = v11;
  v33.size.double height = v13;
  double Height = CGRectGetHeight(v33);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v15 = self->_viewElements;
  uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    double v18 = Height + -16.0;
    uint64_t v19 = *(void *)v27;
    double v20 = 4.0;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v27 != v19) {
          objc_enumerationMutation(v15);
        }
        v22 = -[NSMapTable objectForKey:](self->_viewElementViews, "objectForKey:", *(void *)(*((void *)&v26 + 1) + 8 * v21), (void)v26);
        v34.origin.double x = v7;
        v34.origin.double y = v9;
        v34.size.double width = v11;
        v34.size.double height = v13;
        double Width = CGRectGetWidth(v34);
        objc_msgSend(v22, "sizeThatFits:", Width, v18);
        double v25 = v24;
        objc_msgSend(v22, "setFrame:", 17.0, v20, Width, v24);
        double v20 = v20 + v25 + 3.5;

        ++v21;
      }
      while (v17 != v21);
      uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v17);
  }
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
        +[SKUIMenuBarTemplateShelfFixedElementsCollectionViewCell prefetchResourcesForViewElement:reason:context:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  uint64_t v24 = 0;
  double v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __106__SKUIMenuBarTemplateShelfFixedElementsCollectionViewCell_prefetchResourcesForViewElement_reason_context___block_invoke;
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

uint64_t __106__SKUIMenuBarTemplateShelfFixedElementsCollectionViewCell_prefetchResourcesForViewElement_reason_context___block_invoke(uint64_t a1, uint64_t a2)
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
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v8) {
        +[SKUIMenuBarTemplateShelfFixedElementsCollectionViewCell preferredSizeForViewElement:context:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  [v6 defaultItemWidthForViewElement:v7];
  objc_msgSend(a1, "sizeThatFitsWidth:viewElement:context:", v7, v6);
  double v17 = v16;
  double v19 = v18;

  double v20 = v17;
  double v21 = v19;
  result.double height = v21;
  result.double width = v20;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = a1;
  uint64_t v11 = [a1 _leftPositionedChildrenOfViewElement:v8];
  int64_t v23 = v9;
  uint64_t v12 = [v9 labelLayoutCache];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v13);
        }
        double v18 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v19 = [v18 elementType];
        if (v19 != 141)
        {
          if (v19 == 138)
          {
            id v21 = v8;
            id v22 = v18;
            double v20 = [v10 _attributedStringForLabel:v22 context:v23];
            [v12 requestLayoutForLabel:v22 attributedString:v20 width:(uint64_t)a4];

            id v8 = v21;
            goto LABEL_11;
          }
          if (v19 != 12) {
            continue;
          }
        }
        double v20 = [v10 _attributedStringForButton:v18 context:v23];
        [v12 requestLayoutForButton:v8 attributedString:v20 width:(uint64_t)a4];
LABEL_11:
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v15);
  }
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v6) {
        +[SKUIMenuBarTemplateShelfFixedElementsCollectionViewCell sizeThatFitsWidth:viewElement:context:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  double v14 = 63.0;
  double v15 = a3;
  result.double height = v14;
  result.double width = v15;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [(NSHashTable *)self->_artworkRelatedChildViewElementViews removeAllObjects];
  [(NSMapTable *)self->_imageViewToImageResourceCacheKey removeAllObjects];
  [(NSMapTable *)self->_viewElementViews removeAllObjects];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __95__SKUIMenuBarTemplateShelfFixedElementsCollectionViewCell_reloadWithViewElement_width_context___block_invoke;
  v12[3] = &unk_1E64234F8;
  v12[4] = self;
  id v13 = v8;
  double v15 = a4;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(SKUIViewReuseCollectionViewCell *)self modifyUsingBlock:v12];
}

void __95__SKUIMenuBarTemplateShelfFixedElementsCollectionViewCell_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [(id)objc_opt_class() _leftPositionedChildrenOfViewElement:*(void *)(a1 + 40)];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v10 = [v9 elementType];
        uint64_t v11 = v10;
        id v12 = 0;
        if (v10 > 137)
        {
          if (v10 == 138)
          {
            id v12 = [v3 addLabelViewWithElement:v9 width:*(void *)(a1 + 48) context:*(double *)(a1 + 56)];
          }
          else
          {
            id v13 = 0;
            if (v10 != 141) {
              goto LABEL_24;
            }
            id v12 = [v3 addButtonWithElement:v9 width:*(void *)(a1 + 48) context:*(double *)(a1 + 56)];
            LODWORD(v15) = -1.0;
            [v12 setCharge:v15];
          }
LABEL_16:
          id v13 = 0;
          if (!v12) {
            goto LABEL_18;
          }
LABEL_17:
          [*(id *)(*(void *)(a1 + 32) + 864) setObject:v12 forKey:v9];
          goto LABEL_18;
        }
        if (v10 != 12)
        {
          id v13 = 0;
          if (v10 != 50) {
            goto LABEL_24;
          }
        }
        id v12 = [v3 addButtonWithElement:v9 width:*(void *)(a1 + 48) context:*(double *)(a1 + 56)];
        LODWORD(v14) = -0.5;
        [v12 setCharge:v14];
        if (v11 != 50) {
          goto LABEL_16;
        }
        id v12 = v12;
        id v13 = v12;
        if (v12) {
          goto LABEL_17;
        }
LABEL_18:
        if (v13)
        {
          uint64_t v16 = [*(id *)(a1 + 48) imageResourceCacheKeyForViewElement:*(void *)(a1 + 40)];
          if (v16)
          {
            double v17 = *(void **)(*(void *)(a1 + 32) + 856);
            if (!v17)
            {
              uint64_t v18 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:517 valueOptions:0 capacity:1];
              uint64_t v19 = *(void *)(a1 + 32);
              double v20 = *(void **)(v19 + 856);
              *(void *)(v19 + 856) = v18;

              double v17 = *(void **)(*(void *)(a1 + 32) + 856);
            }
            [v17 setObject:v16 forKey:v13];
          }
        }
LABEL_24:
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v6);
  }
  uint64_t v21 = *(void *)(a1 + 32);
  id v22 = *(void **)(v21 + 872);
  *(void *)(v21 + 872) = v4;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (a3.left != self->_contentInset.left
    || a3.top != self->_contentInset.top
    || a3.right != self->_contentInset.right
    || a3.bottom != self->_contentInset.bottom)
  {
    self->_contentInset = a3;
    [(SKUIMenuBarTemplateShelfFixedElementsCollectionViewCell *)self setNeedsLayout];
  }
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v8 = a4;
  id v9 = a5;
  id v26 = v8;
  uint64_t v10 = [v8 requestIdentifier];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  obj = self->_imageViewToImageResourceCacheKey;
  uint64_t v11 = [(NSMapTable *)obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v34;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(obj);
        }
        double v15 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v16 = [(NSMapTable *)self->_imageViewToImageResourceCacheKey objectForKey:v15];
        double v17 = [v9 requestIdentifierForResourceCacheKey:v16];
        uint64_t v18 = v17;
        if (v17 && [v17 unsignedIntegerValue] == v10)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v24 = [v15 imageView];
            uint64_t v21 = v27;
            [v24 setImage:v27];
          }
          else
          {
            uint64_t v21 = v27;
            [v15 setImage:v27];
          }
          id v22 = v8;

          goto LABEL_23;
        }
      }
      uint64_t v12 = [(NSMapTable *)obj countByEnumeratingWithState:&v33 objects:v38 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obj = self->_artworkRelatedChildViewElementViews;
  uint64_t v19 = [(NSMapTable *)obj countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v30;
    id v22 = v26;
    uint64_t v21 = v27;
LABEL_12:
    uint64_t v23 = 0;
    while (1)
    {
      if (*(void *)v30 != v20) {
        objc_enumerationMutation(obj);
      }
      if ([*(id *)(*((void *)&v29 + 1) + 8 * v23) setImage:v27 forArtworkRequest:v26 context:v9]) {
        break;
      }
      if (v19 == ++v23)
      {
        uint64_t v19 = [(NSMapTable *)obj countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v19) {
          goto LABEL_12;
        }
        goto LABEL_24;
      }
    }
LABEL_23:
    LOBYTE(v19) = 1;
  }
  else
  {
    id v22 = v8;
    uint64_t v21 = v27;
  }
LABEL_24:

  return v19;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = self->_viewElementViews;
  uint64_t v6 = [(NSMapTable *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "itmlID", (void)v15);
        int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          uint64_t v13 = [(NSMapTable *)self->_viewElementViews objectForKey:v10];
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSMapTable *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v13 = 0;
LABEL_11:

  return v13;
}

+ (id)_attributedStringForButton:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 buttonTitleStyle];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = SKUIViewElementFontWithStyle(v7);
  }
  else
  {
    uint64_t v10 = [v5 style];
    id v9 = SKUIViewElementFontWithStyle(v10);
  }
  if (!v9)
  {
    id v9 = [MEMORY[0x1E4FB08E0] systemFontOfSize:11.0];
  }
  uint64_t v11 = [v5 buttonTitleStyle];
  int v12 = v11;
  if (!v11)
  {
    int v12 = [v5 style];
  }
  uint64_t v13 = [v6 tintColor];
  double v14 = SKUIViewElementPlainColorWithStyle(v12, v13);

  if (!v11) {
  if (!v14)
  }
  {
    double v14 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.8];
  }
  long long v15 = [v5 buttonText];
  long long v16 = [v5 style];
  long long v17 = [v15 attributedStringWithDefaultFont:v9 foregroundColor:v14 style:v16];

  return v17;
}

+ (id)_attributedStringForLabel:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 style];
  uint64_t v8 = SKUIViewElementFontWithStyle(v7);

  if (!v8)
  {
    uint64_t v8 = [MEMORY[0x1E4FB08E0] systemFontOfSize:11.0];
  }
  id v9 = [v5 style];
  uint64_t v10 = [v6 tintColor];

  uint64_t v11 = SKUIViewElementPlainColorWithStyle(v9, v10);

  if (!v11)
  {
    uint64_t v11 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.8];
  }
  int v12 = [v5 text];
  uint64_t v13 = [v5 style];
  double v14 = [v12 attributedStringWithDefaultFont:v8 foregroundColor:v11 style:v13];

  return v14;
}

+ (id)_leftPositionedChildrenOfViewElement:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__1;
  uint64_t v11 = __Block_byref_object_dispose__1;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __96__SKUIMenuBarTemplateShelfFixedElementsCollectionViewCell__leftPositionedChildrenOfViewElement___block_invoke;
  v6[3] = &unk_1E6422498;
  v6[4] = &v7;
  [v3 enumerateChildrenUsingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __96__SKUIMenuBarTemplateShelfFixedElementsCollectionViewCell__leftPositionedChildrenOfViewElement___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  id v3 = [v12 style];
  id v4 = [v3 valueForStyle:@"itml-shelf-zooming-layout-element-placement"];
  int v5 = [v4 isEqualToString:@"fixed"];

  uint64_t v6 = [v3 elementPosition];
  if (v5)
  {
    if (v6 == 4)
    {
      uint64_t v7 = [v12 elementType];
      if (v7 == 12 || v7 == 141 || v7 == 138)
      {
        uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
        if (!v8)
        {
          id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
          uint64_t v11 = *(void **)(v10 + 40);
          *(void *)(v10 + 40) = v9;

          uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
        }
        [v8 addObject:v12];
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElements, 0);
  objc_storeStrong((id *)&self->_viewElementViews, 0);
  objc_storeStrong((id *)&self->_imageViewToImageResourceCacheKey, 0);

  objc_storeStrong((id *)&self->_artworkRelatedChildViewElementViews, 0);
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

+ (void)sizeThatFitsWidth:(uint64_t)a3 viewElement:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end