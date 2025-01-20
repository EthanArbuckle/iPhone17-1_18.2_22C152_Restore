@interface SUUIKeyValueInfoListCollectionViewCell
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (double)titleColumnWidthWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
+ (id)_attributedStringForButton:(id)a3 context:(id)a4;
+ (id)_attributedStringForLabel:(id)a3 context:(id)a4;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (SUUIKeyValueInfoListCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)viewForElementIdentifier:(id)a3;
- (void)_buttonAction:(id)a3;
- (void)_imageTapAction:(id)a3;
- (void)layoutSubviews;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
@end

@implementation SUUIKeyValueInfoListCollectionViewCell

- (SUUIKeyValueInfoListCollectionViewCell)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SUUIKeyValueInfoListCollectionViewCell;
  v3 = -[SUUIViewReuseCollectionViewCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:517 valueOptions:0 capacity:0];
    valueViews = v3->_valueViews;
    v3->_valueViews = (NSMapTable *)v4;
  }
  return v3;
}

+ (double)titleColumnWidthWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a5;
  v9 = [a3 titleElement];
  if (v9)
  {
    v10 = [a1 _attributedStringForLabel:v9 context:v8];
    float v11 = a4 * 0.4;
    v12 = [v8 labelLayoutCache];
    [v12 requestLayoutForLabel:v9 attributedString:v10 width:vcvtms_s32_f32(v11)];
    [v12 sizeForLabel:v9 width:floorf(v11)];
    *(float *)&double v13 = v13;
    double v14 = ceilf(*(float *)&v13);
  }
  else
  {
    double v14 = 0.0;
  }

  return v14;
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
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [v9 labelLayoutCache];
  int v11 = [v9 aggregateValueForKey:@"SUUIKVILTCWK"];
  [v11 floatValue];
  float v13 = v12;

  v25 = v8;
  double v14 = [v8 valueElements];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    double v17 = a4 - v13 + -14.0;
    uint64_t v18 = (uint64_t)v17;
    uint64_t v19 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v27 != v19) {
          objc_enumerationMutation(v14);
        }
        v21 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v22 = [v21 elementType];
        if (v22 <= 134)
        {
          switch(v22)
          {
            case 8:
              [v10 requestLayoutForBadge:v21 width:(uint64_t)a4];
              break;
            case 12:
LABEL_13:
              v24 = [a1 _attributedStringForButton:v21 context:v9];
              [v10 requestLayoutForButton:v21 attributedString:v24 width:v18];
LABEL_15:

              break;
            case 62:
              v23 = SUUIHorizontalListView;
LABEL_17:
              [(__objc2_class *)v23 requestLayoutForViewElement:v21 width:v9 context:v17];
              break;
          }
        }
        else
        {
          switch(v22)
          {
            case 135:
              v23 = SUUIStarRatingViewElementView;
              goto LABEL_17;
            case 138:
              v24 = [a1 _attributedStringForLabel:v21 context:v9];
              [v10 requestLayoutForLabel:v21 attributedString:v24 width:v18];
              goto LABEL_15;
            case 141:
              goto LABEL_13;
            case 144:
              v23 = SUUITomatoRatingView;
              goto LABEL_17;
            default:
              continue;
          }
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v16);
  }
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  id v9 = [v7 titleElement];
  double v10 = 0.0;
  double v11 = 0.0;
  if (v9)
  {
    float v12 = a3 * 0.4;
    [v8 sizeForViewElement:v9 width:floorf(v12)];
    double v11 = v13;
  }
  double v14 = [v8 aggregateValueForKey:@"SUUIKVILTCWK"];
  [v14 floatValue];
  float v16 = v15;

  double v17 = [v7 valueElements];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    double v20 = a3 - v16 + -14.0;
    uint64_t v21 = *(void *)v27;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v17);
        }
        [v8 sizeForViewElement:*(void *)(*((void *)&v26 + 1) + 8 * v22) width:v20];
        double v10 = v10 + v23;
        ++v22;
      }
      while (v19 != v22);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v19);
  }
  if (v11 < v10) {
    double v11 = v10;
  }

  double v24 = a3;
  double v25 = v11;
  result.height = v25;
  result.width = v24;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  double v10 = [v9 aggregateValueForKey:@"SUUIKVILTCWK"];
  [v10 floatValue];
  self->_titleColumnWidth = v11;

  titleView = self->_titleView;
  self->_titleView = 0;

  [(NSMapTable *)self->_valueViews removeAllObjects];
  [(NSMapTable *)self->_imageViewToImageResourceCacheKey removeAllObjects];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __78__SUUIKeyValueInfoListCollectionViewCell_reloadWithViewElement_width_context___block_invoke;
  v15[3] = &unk_265400C88;
  id v16 = v8;
  double v17 = self;
  double v19 = a4;
  id v18 = v9;
  id v13 = v9;
  id v14 = v8;
  [(SUUIViewReuseCollectionViewCell *)self modifyUsingBlock:v15];
}

void __78__SUUIKeyValueInfoListCollectionViewCell_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) titleElement];
  float v5 = *(double *)(a1 + 56) * 0.4;
  v32 = (void *)v4;
  uint64_t v6 = objc_msgSend(v3, "addLabelViewWithElement:width:context:", floorf(v5));
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = *(void **)(v7 + 824);
  *(void *)(v7 + 824) = v6;

  double v9 = *(double *)(a1 + 56);
  double v10 = *(double *)(*(void *)(a1 + 40) + 816);
  float v11 = [*(id *)(a1 + 32) valueElements];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    double v14 = v9 - v10 + -14.0;
    uint64_t v15 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v34 != v15) {
          objc_enumerationMutation(v11);
        }
        double v17 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v18 = [v17 elementType];
        id v19 = 0;
        if (v18 > 61)
        {
          switch(v18)
          {
            case 135:
              uint64_t v20 = [v3 addStarRatingViewWithViewElement:v17 width:*(void *)(a1 + 48) context:v14];
              goto LABEL_31;
            case 136:
            case 137:
            case 139:
            case 140:
            case 142:
            case 143:
              goto LABEL_39;
            case 138:
              uint64_t v20 = [v3 addLabelViewWithElement:v17 width:*(void *)(a1 + 48) context:v14];
              goto LABEL_31;
            case 141:
              goto LABEL_15;
            case 144:
              uint64_t v20 = [v3 addTomatoRatingViewWithViewElement:v17 width:*(void *)(a1 + 48) context:v14];
              goto LABEL_31;
            default:
              if (v18 != 62)
              {
                if (v18 != 152) {
                  goto LABEL_39;
                }
                double v23 = [v3 addImageViewWithVideoElement:v17 context:*(void *)(a1 + 48)];
                goto LABEL_24;
              }
              uint64_t v20 = [v3 addHorizontalListWithElement:v17 width:*(void *)(a1 + 48) context:v14];
LABEL_31:
              id v19 = (id)v20;
              id v22 = 0;
              if (!v20) {
                goto LABEL_33;
              }
              break;
          }
LABEL_32:
          [*(id *)(*(void *)(a1 + 40) + 832) setObject:v17 forKey:v19];
          goto LABEL_33;
        }
        if (v18 > 48)
        {
          if (v18 == 49)
          {
            double v25 = [v3 addImageViewWithElement:v17 context:*(void *)(a1 + 48)];
            long long v26 = [v25 tapRecognizer];
            [v26 addTarget:*(void *)(a1 + 40) action:sel__imageTapAction_];

            id v24 = v25;
            goto LABEL_26;
          }
          if (v18 != 50) {
            goto LABEL_39;
          }
        }
        else
        {
          if (v18 == 8)
          {
            double v23 = [v3 addBadgeViewWithElement:v17 width:*(void *)(a1 + 48) context:v14];
LABEL_24:
            id v24 = v23;
LABEL_26:
            id v22 = v24;
            id v19 = v24;
            if (v24) {
              goto LABEL_32;
            }
            goto LABEL_33;
          }
          if (v18 != 12) {
            goto LABEL_39;
          }
        }
LABEL_15:
        uint64_t v21 = [v3 addButtonWithElement:v17 width:*(void *)(a1 + 48) context:v14];
        [v21 addTarget:*(void *)(a1 + 40) action:sel__buttonAction_ forControlEvents:64];
        id v19 = v21;
        if ([v17 elementType] == 50) {
          id v22 = v19;
        }
        else {
          id v22 = 0;
        }

        if (v19) {
          goto LABEL_32;
        }
LABEL_33:
        if (v22)
        {
          long long v27 = [*(id *)(a1 + 48) imageResourceCacheKeyForViewElement:v17];
          if (v27)
          {
            long long v28 = *(void **)(*(void *)(a1 + 40) + 840);
            if (!v28)
            {
              uint64_t v29 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:517 valueOptions:0 capacity:1];
              uint64_t v30 = *(void *)(a1 + 40);
              uint64_t v31 = *(void **)(v30 + 840);
              *(void *)(v30 + 840) = v29;

              long long v28 = *(void **)(*(void *)(a1 + 40) + 840);
            }
            [v28 setObject:v27 forKey:v22];
          }
        }
LABEL_39:
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v13);
  }
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
  obj = self->_imageViewToImageResourceCacheKey;
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
        id v16 = -[NSMapTable objectForKey:](self->_imageViewToImageResourceCacheKey, "objectForKey:", v15, v22);
        double v17 = [v9 requestIdentifierForResourceCacheKey:v16];
        uint64_t v18 = v17;
        if (v17 && [v17 unsignedIntegerValue] == v10)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v20 = [v15 imageView];
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
  v2 = self;
  uint64_t v67 = *MEMORY[0x263EF8340];
  v65.receiver = self;
  v65.super_class = (Class)SUUIKeyValueInfoListCollectionViewCell;
  [(SUUICollectionViewCell *)&v65 layoutSubviews];
  id v3 = [(SUUIKeyValueInfoListCollectionViewCell *)v2 contentView];
  [v3 bounds];
  rect[0] = v4;
  CGFloat v6 = v5;
  double v8 = v7;
  CGFloat v10 = v9;

  [(SUUIViewReuseCollectionViewCell *)v2 contentInset];
  double MaxY = v11;
  double v14 = v13;
  double v16 = v15;
  uint64_t ShouldReverseLayoutDirection = storeShouldReverseLayoutDirection();
  double y = *(double *)(MEMORY[0x263F001A8] + 8);
  titleView = v2->_titleView;
  CGFloat v61 = y;
  if (titleView)
  {
    [(SUUIAttributedStringView *)titleView firstBaselineOffset];
    double v56 = v20;
    -[SUUIAttributedStringView sizeThatFits:](v2->_titleView, "sizeThatFits:", v2->_titleColumnWidth, 1.79769313e308);
    double v22 = v21;
    uint64_t v24 = v23;
    if (ShouldReverseLayoutDirection)
    {
      *(id *)&v68.origin.x = rect[0];
      v68.origin.double y = v6;
      v68.size.width = v8;
      v68.size.double height = v10;
      double v25 = CGRectGetMaxX(v68) - v14 - v2->_titleColumnWidth;
    }
    else
    {
      double v25 = v14 + v2->_titleColumnWidth - v21;
    }
    double v28 = MaxY;
    double v29 = v22;
    uint64_t v30 = v24;
    CGRect v69 = CGRectIntegral(*(CGRect *)&v25);
    double y = v69.origin.y;
    double height = v69.size.height;
    [(SUUIAttributedStringView *)v2->_titleView setFrame:v69.origin.x];
    if (ShouldReverseLayoutDirection) {
      goto LABEL_8;
    }
LABEL_5:
    double v26 = v14 + v2->_titleColumnWidth;
    double v27 = 14.0;
    goto LABEL_9;
  }
  double height = *(double *)(MEMORY[0x263F001A8] + 24);
  double v56 = 0.0;
  if ((ShouldReverseLayoutDirection & 1) == 0) {
    goto LABEL_5;
  }
LABEL_8:
  *(id *)&v70.origin.x = rect[0];
  v70.origin.double y = v6;
  v70.size.width = v8;
  v70.size.double height = v10;
  double v26 = CGRectGetMaxX(v70) - v14 - v2->_titleColumnWidth;
  double v27 = -14.0;
LABEL_9:
  double v31 = v26 + v27;
  [(SUUIViewReuseCollectionViewCell *)v2 allExistingViews];
  memset(&rect[1], 0, 32);
  long long v63 = 0u;
  long long v64 = 0u;
  rect[0] = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v32 = [rect[0] countByEnumeratingWithState:&rect[1] objects:v66 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = 0;
    float v35 = v8 - v16 - v31;
    double v36 = floorf(v35);
    uint64_t v37 = *(void *)rect[3];
    double v57 = y + v56;
    uint64_t v59 = *(void *)rect[3];
    do
    {
      uint64_t v38 = 0;
      uint64_t v60 = v33;
      do
      {
        if (*(void *)rect[3] != v37) {
          objc_enumerationMutation(rect[0]);
        }
        v39 = (SUUIAttributedStringView *)*((void *)rect[2] + v38);
        if (v39 != v2->_titleView)
        {
          objc_msgSend(*((id *)rect[2] + v38), "sizeThatFits:", v36, 1.79769313e308);
          double v41 = v40;
          double v43 = v42;
          double v44 = v31;
          if (ShouldReverseLayoutDirection)
          {
            v71.origin.x = v31;
            v71.origin.double y = v61;
            v71.size.width = v41;
            v71.size.double height = v43;
            double v44 = v31 - CGRectGetWidth(v71);
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v45 = ShouldReverseLayoutDirection;
            v46 = v39;
            [(SUUIAttributedStringView *)v46 firstBaselineOffset];
            double v48 = v47;
            v49 = v2;
            int v50 = [(SUUIAttributedStringView *)v2->_titleView usesTallCharacterSet];
            int v51 = [(SUUIAttributedStringView *)v46 usesTallCharacterSet];

            if (v34)
            {
              uint64_t ShouldReverseLayoutDirection = v45;
              v2 = v49;
              uint64_t v37 = v59;
              uint64_t v33 = v60;
LABEL_27:
              -[SUUIAttributedStringView setFrame:](v39, "setFrame:", v44, MaxY, v41, v43);
              v72.origin.x = v44;
              v72.origin.double y = MaxY;
              v72.size.width = v41;
              v72.size.double height = v43;
              double MaxY = CGRectGetMaxY(v72);
              ++v34;
              goto LABEL_28;
            }
            BOOL v52 = v50 == v51;
            uint64_t ShouldReverseLayoutDirection = v45;
            v2 = v49;
            uint64_t v37 = v59;
            uint64_t v33 = v60;
            if (!v52)
            {
              float v53 = MaxY + v56 - v48;
              float v54 = floorf(v53);
              goto LABEL_26;
            }
          }
          else if (v34)
          {
            goto LABEL_27;
          }
          double MaxY = v61;
          if (v43 >= height) {
            goto LABEL_27;
          }
          float v55 = v57 - v43;
          float v54 = ceilf(v55);
LABEL_26:
          double MaxY = v54;
          goto LABEL_27;
        }
LABEL_28:
        ++v38;
      }
      while (v33 != v38);
      uint64_t v33 = [rect[0] countByEnumeratingWithState:&rect[1] objects:v66 count:16];
    }
    while (v33);
  }
}

- (void)_buttonAction:(id)a3
{
  uint64_t v4 = [(NSMapTable *)self->_valueViews objectForKey:a3];
  if (v4)
  {
    id v8 = v4;
    double v5 = SUUICollectionViewForView(self);
    CGFloat v6 = [v5 delegate];
    if (objc_opt_respondsToSelector())
    {
      double v7 = [v5 indexPathForCell:self];
      [v6 collectionView:v5 didConfirmButtonElement:v8 withClickInfo:0 forItemAtIndexPath:v7];
    }
    else
    {
      [v8 dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];
    }

    uint64_t v4 = v8;
  }
}

- (void)_imageTapAction:(id)a3
{
  valueViews = self->_valueViews;
  uint64_t v4 = [a3 view];
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
  CGFloat v10 = v9;

  double v11 = SUUIViewElementFontWithStyle(v10);
  if (!v11)
  {
    double v11 = SUUIFontPreferredFontForTextStyle(5);
  }
  uint64_t v12 = [v6 tintColor];
  double v13 = SUUIViewElementPlainColorWithStyle(v10, v12);

  if (!v13)
  {
    double v13 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.8];
  }
  double v14 = [v5 buttonText];
  double v15 = [v14 attributedStringWithDefaultFont:v11 foregroundColor:v13 style:v10];

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
  CGFloat v10 = SUUIViewElementPlainColorWithStyle(v7, v9);

  if (!v10)
  {
    BOOL v11 = [v5 labelViewStyle] == 5;
    CGFloat v10 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:dbl_2568A0EB0[v11]];
  }
  uint64_t v12 = [v5 text];
  double v13 = [v12 attributedStringWithDefaultFont:v8 foregroundColor:v10 style:v7];

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageViewToImageResourceCacheKey, 0);
  objc_storeStrong((id *)&self->_valueViews, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
}

@end