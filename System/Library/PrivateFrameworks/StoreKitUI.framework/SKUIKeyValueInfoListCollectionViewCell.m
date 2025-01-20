@interface SKUIKeyValueInfoListCollectionViewCell
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (double)titleColumnWidthWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
+ (id)_attributedStringForButton:(id)a3 context:(id)a4;
+ (id)_attributedStringForLabel:(id)a3 context:(id)a4;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (SKUIKeyValueInfoListCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)viewForElementIdentifier:(id)a3;
- (void)_buttonAction:(id)a3;
- (void)_imageTapAction:(id)a3;
- (void)layoutSubviews;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
@end

@implementation SKUIKeyValueInfoListCollectionViewCell

- (SKUIKeyValueInfoListCollectionViewCell)initWithFrame:(CGRect)a3
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
        -[SKUIKeyValueInfoListCollectionViewCell initWithFrame:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)SKUIKeyValueInfoListCollectionViewCell;
  v16 = -[SKUIViewReuseCollectionViewCell initWithFrame:](&v20, sel_initWithFrame_, x, y, width, height);
  if (v16)
  {
    uint64_t v17 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:517 valueOptions:0 capacity:0];
    valueViews = v16->_valueViews;
    v16->_valueViews = (NSMapTable *)v17;
  }
  return v16;
}

+ (double)titleColumnWidthWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v10) {
        +[SKUIKeyValueInfoListCollectionViewCell titleColumnWidthWithViewElement:width:context:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  v18 = [v8 titleElement];
  if (v18)
  {
    v19 = [a1 _attributedStringForLabel:v18 context:v9];
    float v20 = a4 * 0.4;
    v21 = [v9 labelLayoutCache];
    [v21 requestLayoutForLabel:v18 attributedString:v19 width:vcvtms_s32_f32(v20)];
    [v21 sizeForLabel:v18 width:floorf(v20)];
    *(float *)&double v22 = v22;
    double v23 = ceilf(*(float *)&v22);
  }
  else
  {
    double v23 = 0.0;
  }

  return v23;
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v9) {
        +[SKUIKeyValueInfoListCollectionViewCell prefetchResourcesForViewElement:reason:context:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  uint64_t v17 = [v7 valueElements];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    int v20 = 0;
    uint64_t v21 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v25 != v21) {
          objc_enumerationMutation(v17);
        }
        v20 |= [v8 prefetchResourcesForViewElement:*(void *)(*((void *)&v24 + 1) + 8 * i) reason:a4];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v19);
  }
  else
  {
    LOBYTE(v20) = 0;
  }

  return v20 & 1;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        +[SKUIKeyValueInfoListCollectionViewCell preferredSizeForViewElement:context:](v4, v5, v6, v7, v8, v9, v10, v11);
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
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v10) {
        +[SKUIKeyValueInfoListCollectionViewCell requestLayoutForViewElement:width:context:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  uint64_t v18 = [v9 labelLayoutCache];
  uint64_t v19 = [v9 aggregateValueForKey:@"SKUIKVILTCWK"];
  [v19 floatValue];
  float v21 = v20;

  v33 = v8;
  double v22 = [v8 valueElements];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    double v25 = a4 - v21 + -14.0;
    uint64_t v26 = (uint64_t)v25;
    uint64_t v27 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v35 != v27) {
          objc_enumerationMutation(v22);
        }
        uint64_t v29 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v30 = [v29 elementType];
        if (v30 <= 134)
        {
          switch(v30)
          {
            case 8:
              [v18 requestLayoutForBadge:v29 width:(uint64_t)a4];
              break;
            case 12:
LABEL_17:
              v32 = [a1 _attributedStringForButton:v29 context:v9];
              [v18 requestLayoutForButton:v29 attributedString:v32 width:v26];
LABEL_19:

              break;
            case 62:
              v31 = SKUIHorizontalListView;
LABEL_21:
              [(__objc2_class *)v31 requestLayoutForViewElement:v29 width:v9 context:v25];
              break;
          }
        }
        else
        {
          switch(v30)
          {
            case 135:
              v31 = SKUIStarRatingViewElementView;
              goto LABEL_21;
            case 138:
              v32 = [a1 _attributedStringForLabel:v29 context:v9];
              [v18 requestLayoutForLabel:v29 attributedString:v32 width:v26];
              goto LABEL_19;
            case 141:
              goto LABEL_17;
            case 144:
              v31 = SKUITomatoRatingView;
              goto LABEL_21;
            default:
              continue;
          }
        }
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v24);
  }
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v9) {
        +[SKUIKeyValueInfoListCollectionViewCell sizeThatFitsWidth:viewElement:context:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  uint64_t v17 = [v7 titleElement];
  double v18 = 0.0;
  double v19 = 0.0;
  if (v17)
  {
    float v20 = a3 * 0.4;
    [v8 sizeForViewElement:v17 width:floorf(v20)];
    double v19 = v21;
  }
  double v22 = [v8 aggregateValueForKey:@"SKUIKVILTCWK"];
  [v22 floatValue];
  float v24 = v23;

  double v25 = [v7 valueElements];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    double v28 = a3 - v24 + -14.0;
    uint64_t v29 = *(void *)v35;
    do
    {
      uint64_t v30 = 0;
      do
      {
        if (*(void *)v35 != v29) {
          objc_enumerationMutation(v25);
        }
        [v8 sizeForViewElement:*(void *)(*((void *)&v34 + 1) + 8 * v30) width:v28];
        double v18 = v18 + v31;
        ++v30;
      }
      while (v27 != v30);
      uint64_t v27 = [v25 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v27);
  }
  if (v19 < v18) {
    double v19 = v18;
  }

  double v32 = a3;
  double v33 = v19;
  result.double height = v33;
  result.double width = v32;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [v9 aggregateValueForKey:@"SKUIKVILTCWK"];
  [v10 floatValue];
  self->_titleColumnWidth = v11;

  titleView = self->_titleView;
  self->_titleView = 0;

  [(NSMapTable *)self->_valueViews removeAllObjects];
  [(NSMapTable *)self->_imageViewToImageResourceCacheKey removeAllObjects];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78__SKUIKeyValueInfoListCollectionViewCell_reloadWithViewElement_width_context___block_invoke;
  v15[3] = &unk_1E64234F8;
  id v16 = v8;
  uint64_t v17 = self;
  double v19 = a4;
  id v18 = v9;
  id v13 = v9;
  id v14 = v8;
  [(SKUIViewReuseCollectionViewCell *)self modifyUsingBlock:v15];
}

void __78__SKUIKeyValueInfoListCollectionViewCell_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) titleElement];
  float v5 = *(double *)(a1 + 56) * 0.4;
  double v32 = (void *)v4;
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
        uint64_t v17 = *(void **)(*((void *)&v33 + 1) + 8 * i);
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
                float v23 = [v3 addImageViewWithVideoElement:v17 context:*(void *)(a1 + 48)];
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
            uint64_t v26 = [v25 tapRecognizer];
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
            float v23 = [v3 addBadgeViewWithElement:v17 width:*(void *)(a1 + 48) context:v14];
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
        double v21 = [v3 addButtonWithElement:v17 width:*(void *)(a1 + 48) context:v14];
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
          uint64_t v27 = [*(id *)(a1 + 48) imageResourceCacheKeyForViewElement:v17];
          if (v27)
          {
            double v28 = *(void **)(*(void *)(a1 + 40) + 840);
            if (!v28)
            {
              uint64_t v29 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:517 valueOptions:0 capacity:1];
              uint64_t v30 = *(void *)(a1 + 40);
              double v31 = *(void **)(v30 + 840);
              *(void *)(v30 + 840) = v29;

              double v28 = *(void **)(*(void *)(a1 + 40) + 840);
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
  uint64_t v29 = *MEMORY[0x1E4F143B8];
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
        uint64_t v17 = [v9 requestIdentifierForResourceCacheKey:v16];
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
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  v65.receiver = self;
  v65.super_class = (Class)SKUIKeyValueInfoListCollectionViewCell;
  [(SKUICollectionViewCell *)&v65 layoutSubviews];
  id v3 = [(SKUIKeyValueInfoListCollectionViewCell *)v2 contentView];
  [v3 bounds];
  rect[0] = v4;
  CGFloat v6 = v5;
  double v8 = v7;
  CGFloat v10 = v9;

  [(SKUIViewReuseCollectionViewCell *)v2 contentInset];
  double MaxY = v11;
  double v14 = v13;
  double v16 = v15;
  uint64_t ShouldReverseLayoutDirection = storeShouldReverseLayoutDirection();
  double y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  titleView = v2->_titleView;
  CGFloat v61 = y;
  if (titleView)
  {
    [(SKUIAttributedStringView *)titleView firstBaselineOffset];
    double v56 = v20;
    -[SKUIAttributedStringView sizeThatFits:](v2->_titleView, "sizeThatFits:", v2->_titleColumnWidth, 1.79769313e308);
    double v22 = v21;
    uint64_t v24 = v23;
    if (ShouldReverseLayoutDirection)
    {
      *(id *)&v68.origin.double x = rect[0];
      v68.origin.double y = v6;
      v68.size.double width = v8;
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
    [(SKUIAttributedStringView *)v2->_titleView setFrame:v69.origin.x];
    if (ShouldReverseLayoutDirection) {
      goto LABEL_8;
    }
LABEL_5:
    double v26 = v14 + v2->_titleColumnWidth;
    double v27 = 14.0;
    goto LABEL_9;
  }
  double height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v56 = 0.0;
  if ((ShouldReverseLayoutDirection & 1) == 0) {
    goto LABEL_5;
  }
LABEL_8:
  *(id *)&v70.origin.double x = rect[0];
  v70.origin.double y = v6;
  v70.size.double width = v8;
  v70.size.double height = v10;
  double v26 = CGRectGetMaxX(v70) - v14 - v2->_titleColumnWidth;
  double v27 = -14.0;
LABEL_9:
  double v31 = v26 + v27;
  [(SKUIViewReuseCollectionViewCell *)v2 allExistingViews];
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
        uint64_t v39 = (SKUIAttributedStringView *)*((void *)rect[2] + v38);
        if (v39 != v2->_titleView)
        {
          objc_msgSend(*((id *)rect[2] + v38), "sizeThatFits:", v36, 1.79769313e308);
          double v41 = v40;
          double v43 = v42;
          double v44 = v31;
          if (ShouldReverseLayoutDirection)
          {
            v71.origin.double x = v31;
            v71.origin.double y = v61;
            v71.size.double width = v41;
            v71.size.double height = v43;
            double v44 = v31 - CGRectGetWidth(v71);
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v45 = ShouldReverseLayoutDirection;
            v46 = v39;
            [(SKUIAttributedStringView *)v46 firstBaselineOffset];
            double v48 = v47;
            v49 = v2;
            int v50 = [(SKUIAttributedStringView *)v2->_titleView usesTallCharacterSet];
            int v51 = [(SKUIAttributedStringView *)v46 usesTallCharacterSet];

            if (v34)
            {
              uint64_t ShouldReverseLayoutDirection = v45;
              v2 = v49;
              uint64_t v37 = v59;
              uint64_t v33 = v60;
LABEL_27:
              -[SKUIAttributedStringView setFrame:](v39, "setFrame:", v44, MaxY, v41, v43);
              v72.origin.double x = v44;
              v72.origin.double y = MaxY;
              v72.size.double width = v41;
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
    double v5 = SKUICollectionViewForView(self);
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
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v7) {
        +[SKUIKeyValueInfoListCollectionViewCell _attributedStringForButton:context:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  double v15 = [v5 buttonTitleStyle];
  double v16 = v15;
  if (v15)
  {
    id v17 = v15;
  }
  else
  {
    id v17 = [v5 style];
  }
  uint64_t v18 = v17;

  BOOL v19 = SKUIViewElementFontWithStyle(v18);
  if (!v19)
  {
    BOOL v19 = SKUIFontPreferredFontForTextStyle(5);
  }
  double v20 = [v6 tintColor];
  double v21 = SKUIViewElementPlainColorWithStyle(v18, v20);

  if (!v21)
  {
    double v21 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.8];
  }
  double v22 = [v5 buttonText];
  uint64_t v23 = [v22 attributedStringWithDefaultFont:v19 foregroundColor:v21 style:v18];

  return v23;
}

+ (id)_attributedStringForLabel:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v7) {
        +[SKUIKeyValueInfoListCollectionViewCell _attributedStringForLabel:context:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  double v15 = [v5 style];
  double v16 = SKUIViewElementFontWithStyle(v15);
  if (!v16)
  {
    double v16 = SKUIFontPreferredFontForTextStyle(5);
  }
  id v17 = [v6 tintColor];
  uint64_t v18 = SKUIViewElementPlainColorWithStyle(v15, v17);

  if (!v18)
  {
    BOOL v19 = [v5 labelViewStyle] == 5;
    uint64_t v18 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:dbl_1C1CCC050[v19]];
  }
  double v20 = [v5 text];
  double v21 = [v20 attributedStringWithDefaultFont:v16 foregroundColor:v18 style:v15];

  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageViewToImageResourceCacheKey, 0);
  objc_storeStrong((id *)&self->_valueViews, 0);

  objc_storeStrong((id *)&self->_titleView, 0);
}

- (void)initWithFrame:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)titleColumnWidthWithViewElement:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
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

+ (void)_attributedStringForButton:(uint64_t)a3 context:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_attributedStringForLabel:(uint64_t)a3 context:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end