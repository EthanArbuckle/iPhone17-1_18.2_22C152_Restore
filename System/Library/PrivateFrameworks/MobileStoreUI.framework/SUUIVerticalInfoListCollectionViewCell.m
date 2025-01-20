@interface SUUIVerticalInfoListCollectionViewCell
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (id)_attributedStringForButton:(id)a3 context:(id)a4;
+ (id)_attributedStringForLabel:(id)a3 context:(id)a4;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (SUUIVerticalInfoListCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)viewForElementIdentifier:(id)a3;
- (void)_buttonAction:(id)a3;
- (void)_imageTapAction:(id)a3;
- (void)layoutSubviews;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (void)reloadWithViewElements:(id)a3 width:(double)a4 context:(id)a5;
@end

@implementation SUUIVerticalInfoListCollectionViewCell

- (SUUIVerticalInfoListCollectionViewCell)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SUUIVerticalInfoListCollectionViewCell;
  v3 = -[SUUIViewReuseCollectionViewCell initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x263F088B0]) initWithOptions:517 capacity:0];
    titleViews = v3->_titleViews;
    v3->_titleViews = (NSHashTable *)v4;

    uint64_t v6 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:517 valueOptions:0 capacity:0];
    valueViews = v3->_valueViews;
    v3->_valueViews = (NSMapTable *)v6;
  }
  return v3;
}

- (void)reloadWithViewElements:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [(NSHashTable *)self->_titleViews removeAllObjects];
  [(NSMapTable *)self->_valueViews removeAllObjects];
  [(NSMapTable *)self->_imageViewToImageResourceCacheKey removeAllObjects];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __79__SUUIVerticalInfoListCollectionViewCell_reloadWithViewElements_width_context___block_invoke;
  v12[3] = &unk_265400C88;
  double v16 = a4;
  id v13 = v8;
  id v14 = v9;
  v15 = self;
  id v10 = v9;
  id v11 = v8;
  [(SUUIViewReuseCollectionViewCell *)self modifyUsingBlock:v12];
}

void __79__SUUIVerticalInfoListCollectionViewCell_reloadWithViewElements_width_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v30 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v30)
  {
    uint64_t v29 = *(void *)v38;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v38 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v32 = v4;
        v5 = *(void **)(*((void *)&v37 + 1) + 8 * v4);
        uint64_t v6 = [v5 titleElement];
        if (v6)
        {
          v7 = [v3 addLabelViewWithElement:v6 width:*(void *)(a1 + 40) context:*(double *)(a1 + 56)];
          [*(id *)(*(void *)(a1 + 48) + 824) addObject:v7];
        }
        v31 = (void *)v6;
        id v8 = [v5 valueElements];
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v41 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v34;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v34 != v11) {
                objc_enumerationMutation(v8);
              }
              id v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
              uint64_t v14 = [v13 elementType];
              id v15 = 0;
              if (v14 > 61)
              {
                id v16 = 0;
                switch(v14)
                {
                  case 135:
                    uint64_t v17 = [v3 addStarRatingViewWithViewElement:v13 width:*(void *)(a1 + 40) context:*(double *)(a1 + 56)];
                    goto LABEL_40;
                  case 136:
                  case 137:
                  case 139:
                  case 140:
                  case 142:
                  case 143:
                    goto LABEL_49;
                  case 138:
                    uint64_t v17 = [v3 addLabelViewWithElement:v13 width:*(void *)(a1 + 40) context:*(double *)(a1 + 56)];
                    goto LABEL_40;
                  case 141:
                    goto LABEL_23;
                  case 144:
                    uint64_t v17 = [v3 addTomatoRatingViewWithViewElement:v13 width:*(void *)(a1 + 40) context:*(double *)(a1 + 56)];
                    goto LABEL_40;
                  default:
                    if (v14 == 62)
                    {
                      uint64_t v17 = [v3 addHorizontalListWithElement:v13 width:*(void *)(a1 + 40) context:*(double *)(a1 + 56)];
LABEL_40:
                      id v15 = (id)v17;
                      goto LABEL_41;
                    }
                    id v16 = 0;
                    if (v14 != 152) {
                      goto LABEL_49;
                    }
                    v19 = [v3 addImageViewWithVideoElement:v13 context:*(void *)(a1 + 40)];
                    break;
                }
                goto LABEL_32;
              }
              if (v14 <= 31)
              {
                if (v14 == 8)
                {
                  v19 = [v3 addBadgeViewWithElement:v13 width:*(void *)(a1 + 40) context:*(double *)(a1 + 56)];
LABEL_32:
                  id v20 = v19;
                  goto LABEL_34;
                }
                id v16 = 0;
                if (v14 != 12) {
                  goto LABEL_49;
                }
              }
              else
              {
                if (v14 == 32)
                {
                  id v15 = [v3 addDividerWithElement:v13 context:*(void *)(a1 + 40)];
                  [v15 setDividerOrientation:0];
LABEL_41:
                  id v16 = 0;
                  if (!v15) {
                    goto LABEL_43;
                  }
LABEL_42:
                  [*(id *)(*(void *)(a1 + 48) + 832) setObject:v13 forKey:v15];
                  goto LABEL_43;
                }
                if (v14 == 49)
                {
                  v21 = [v3 addImageViewWithElement:v13 context:*(void *)(a1 + 40)];
                  v22 = [v21 tapRecognizer];
                  [v22 addTarget:*(void *)(a1 + 48) action:sel__imageTapAction_];

                  id v20 = v21;
LABEL_34:
                  id v15 = v20;
                  id v16 = v20;
                  if (v20) {
                    goto LABEL_42;
                  }
                  goto LABEL_43;
                }
                id v16 = 0;
                if (v14 != 50) {
                  goto LABEL_49;
                }
              }
LABEL_23:
              v18 = [v3 addButtonWithElement:v13 width:*(void *)(a1 + 40) context:*(double *)(a1 + 56)];
              [v18 addTarget:*(void *)(a1 + 48) action:sel__buttonAction_ forControlEvents:64];
              id v15 = v18;
              if ([v13 elementType] == 50) {
                id v16 = v15;
              }
              else {
                id v16 = 0;
              }

              if (v15) {
                goto LABEL_42;
              }
LABEL_43:
              if (v16)
              {
                v23 = [*(id *)(a1 + 40) imageResourceCacheKeyForViewElement:v13];
                if (v23)
                {
                  v24 = *(void **)(*(void *)(a1 + 48) + 816);
                  if (!v24)
                  {
                    uint64_t v25 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:517 valueOptions:0 capacity:1];
                    uint64_t v26 = *(void *)(a1 + 48);
                    v27 = *(void **)(v26 + 816);
                    *(void *)(v26 + 816) = v25;

                    v24 = *(void **)(*(void *)(a1 + 48) + 816);
                  }
                  [v24 setObject:v23 forKey:v16];
                }
              }
LABEL_49:
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v33 objects:v41 count:16];
          }
          while (v10);
        }

        uint64_t v4 = v32 + 1;
      }
      while (v32 + 1 != v30);
      uint64_t v30 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v30);
  }
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a5;
  id v8 = [a3 valueElements];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    int v11 = 0;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v8);
        }
        v11 |= [v7 prefetchResourcesForViewElement:*(void *)(*((void *)&v15 + 1) + 8 * i) reason:a4];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11 & 1;
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
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [v9 labelLayoutCache];
  uint64_t v11 = [v8 titleElement];
  if (v11)
  {
    uint64_t v12 = [a1 _attributedStringForLabel:v11 context:v9];
    [v10 requestLayoutForLabel:v11 attributedString:v12 width:(uint64_t)a4];
  }
  v23 = v8;
  id v13 = objc_msgSend(v8, "valueElements", v11);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
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
        long long v18 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v19 = [v18 elementType];
        if (v19 <= 134)
        {
          switch(v19)
          {
            case 8:
              [v10 requestLayoutForBadge:v18 width:(uint64_t)a4];
              break;
            case 12:
LABEL_15:
              v21 = [a1 _attributedStringForButton:v18 context:v9];
              [v10 requestLayoutForButton:v18 attributedString:v21 width:(uint64_t)a4];
LABEL_17:

              break;
            case 62:
              uint64_t v20 = SUUIHorizontalListView;
LABEL_19:
              [(__objc2_class *)v20 requestLayoutForViewElement:v18 width:v9 context:a4];
              break;
          }
        }
        else
        {
          switch(v19)
          {
            case 135:
              uint64_t v20 = SUUIStarRatingViewElementView;
              goto LABEL_19;
            case 138:
              v21 = [a1 _attributedStringForLabel:v18 context:v9];
              [v10 requestLayoutForLabel:v18 attributedString:v21 width:(uint64_t)a4];
              goto LABEL_17;
            case 141:
              goto LABEL_15;
            case 144:
              uint64_t v20 = SUUITomatoRatingView;
              goto LABEL_19;
            default:
              continue;
          }
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v15);
  }
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  id v9 = [v7 valueElements];
  uint64_t v10 = [v9 count];
  uint64_t v11 = [v7 titleElement];
  if (v11)
  {
    [v8 sizeForViewElement:v11 width:a3];
    double v13 = v12 + 0.0;
    ++v10;
  }
  else
  {
    double v13 = 0.0;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v14 = v9;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        objc_msgSend(v8, "sizeForViewElement:width:", *(void *)(*((void *)&v22 + 1) + 8 * i), a3, (void)v22);
        double v13 = v13 + v19;
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v16);
  }

  if (v10 >= 2) {
    double v13 = v13 + (float)((float)(v10 - 1) * 0.0);
  }

  double v20 = a3;
  double v21 = v13;
  result.height = v21;
  result.width = v20;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = (objc_class *)MEMORY[0x263EFF8C0];
  id v9 = a5;
  id v10 = a3;
  id v11 = (id)objc_msgSend([v8 alloc], "initWithObjects:", v10, 0);

  [(SUUIVerticalInfoListCollectionViewCell *)self reloadWithViewElements:v11 width:v9 context:a4];
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [a4 requestIdentifier];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = self->_imageViewToImageResourceCacheKey;
  uint64_t v11 = [(NSMapTable *)obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    id v22 = v8;
    uint64_t v13 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v16 = -[NSMapTable objectForKey:](self->_imageViewToImageResourceCacheKey, "objectForKey:", v15, v22);
        uint64_t v17 = [v9 requestIdentifierForResourceCacheKey:v16];
        long long v18 = v17;
        if (v17 && [v17 unsignedIntegerValue] == v10)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            double v20 = [v15 imageView];
            id v8 = v22;
            [v20 setImage:v22];
          }
          else
          {
            id v8 = v22;
            [v15 setImage:v22];
          }

          BOOL v19 = 1;
          goto LABEL_16;
        }
      }
      uint64_t v12 = [(NSMapTable *)obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v12) {
        continue;
      }
      break;
    }
    BOOL v19 = 0;
    id v8 = v22;
  }
  else
  {
    BOOL v19 = 0;
  }
LABEL_16:

  return v19;
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
  v22.receiver = self;
  v22.super_class = (Class)SUUIVerticalInfoListCollectionViewCell;
  [(SUUICollectionViewCell *)&v22 layoutSubviews];
  id v3 = [(SUUIVerticalInfoListCollectionViewCell *)self contentView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  [(SUUIViewReuseCollectionViewCell *)self contentInset];
  uint64_t v13 = v12;
  double v15 = v14;
  double v17 = v16;
  v23.origin.x = v5;
  v23.origin.y = v7;
  v23.size.width = v9;
  v23.size.height = v11;
  double Width = CGRectGetWidth(v23);
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3010000000;
  v21[3] = "";
  *(double *)&v21[4] = v15;
  v21[5] = v13;
  BOOL v19 = [(SUUIViewReuseCollectionViewCell *)self allExistingViews];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __56__SUUIVerticalInfoListCollectionViewCell_layoutSubviews__block_invoke;
  v20[3] = &unk_2654067F0;
  v20[4] = self;
  v20[5] = v21;
  *(double *)&v20[6] = Width - v15 - v17;
  [v19 enumerateObjectsUsingBlock:v20];

  _Block_object_dispose(v21, 8);
}

void __56__SUUIVerticalInfoListCollectionViewCell_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  double v7 = *(double *)(v6 + 32);
  double v8 = *(double *)(v6 + 40);
  id v15 = v5;
  if (a3)
  {
    int v9 = [*(id *)(*(void *)(a1 + 32) + 824) containsObject:v5];
    double v10 = v15;
    if (v9) {
      double v8 = v8 + 13.0;
    }
  }
  else
  {
    double v10 = v5;
  }
  objc_msgSend(v10, "sizeThatFits:", *(double *)(a1 + 48), 1.79769313e308);
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  objc_msgSend(v15, "setFrame:", v7, v8, v11, v13);
  v17.origin.x = v7;
  v17.origin.y = v8;
  v17.size.width = v12;
  v17.size.height = v14;
  *(CGFloat *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = CGRectGetMaxY(v17) + 0.0;
}

- (void)_buttonAction:(id)a3
{
  double v4 = [(NSMapTable *)self->_valueViews objectForKey:a3];
  if (v4)
  {
    id v8 = v4;
    id v5 = SUUICollectionViewForView(self);
    uint64_t v6 = [v5 delegate];
    if (objc_opt_respondsToSelector())
    {
      double v7 = [v5 indexPathForCell:self];
      [v6 collectionView:v5 didConfirmButtonElement:v8 withClickInfo:0 forItemAtIndexPath:v7];
    }
    else
    {
      [v8 dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];
    }

    double v4 = v8;
  }
}

- (void)_imageTapAction:(id)a3
{
  valueViews = self->_valueViews;
  double v4 = [a3 view];
  id v5 = [(NSMapTable *)valueViews objectForKey:v4];

  [v5 dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];
}

+ (id)_attributedStringForButton:(id)a3 context:(id)a4
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
    double v11 = SUUIFontPreferredFontForTextStyle(5);
  }
  CGFloat v12 = [v6 tintColor];
  double v13 = SUUIViewElementPlainColorWithStyle(v10, v12);

  if (!v13)
  {
    double v13 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.8];
  }
  CGFloat v14 = [v5 buttonText];
  id v15 = [v14 attributedStringWithDefaultFont:v11 foregroundColor:v13 style:v10];

  return v15;
}

+ (id)_attributedStringForLabel:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = [v5 style];
  id v8 = SUUIViewElementFontWithStyle(v7);
  if (!v8)
  {
    id v8 = SUUIFontPreferredFontForTextStyle(5);
  }
  id v9 = [v6 tintColor];
  double v10 = SUUIViewElementPlainColorWithStyle(v7, v9);

  if (!v10)
  {
    BOOL v11 = [v5 labelViewStyle] == 5;
    double v10 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:dbl_2568A0EB0[v11]];
  }
  CGFloat v12 = [v5 text];
  double v13 = [v12 attributedStringWithDefaultFont:v8 foregroundColor:v10 style:v7];

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueViews, 0);
  objc_storeStrong((id *)&self->_titleViews, 0);
  objc_storeStrong((id *)&self->_imageViewToImageResourceCacheKey, 0);
}

@end