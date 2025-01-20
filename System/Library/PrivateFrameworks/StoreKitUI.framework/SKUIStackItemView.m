@interface SKUIStackItemView
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5 numberOfLines:(unint64_t *)a6;
+ (id)_attributedStringForLabel:(id)a3 context:(id)a4;
+ (id)_textViewLayoutWithWidth:(double)a3 string:(id)a4;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)imageViews;
- (NSMapTable)imageViewToImageResourceCacheKey;
- (SKUIAttributedStringView)textView;
- (SKUIStackItemViewElement)viewElement;
- (SKUIViewElementLayoutContext)lastContext;
- (UIEdgeInsets)contentInset;
- (id)viewForElementIdentifier:(id)a3;
- (unint64_t)numberOfLines;
- (void)layoutSubviews;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setImageViewToImageResourceCacheKey:(id)a3;
- (void)setImageViews:(id)a3;
- (void)setLastContext:(id)a3;
- (void)setTextView:(id)a3;
- (void)setViewElement:(id)a3;
@end

@implementation SKUIStackItemView

- (unint64_t)numberOfLines
{
  v2 = [(SKUIStackItemView *)self textView];
  v3 = [v2 layout];
  unint64_t v4 = [v3 numberOfLines];

  return v4;
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
        +[SKUIStackItemView prefetchResourcesForViewElement:reason:context:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  v17 = [v7 children];
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
        +[SKUIStackItemView preferredSizeForViewElement:context:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  double v12 = *MEMORY[0x1E4F1DB30];
  double v13 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v13;
  result.width = v12;
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
        +[SKUIStackItemView requestLayoutForViewElement:width:context:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  uint64_t v18 = [v8 labelLayoutCache];
  uint64_t v19 = [v9 textElement];

  if (v19)
  {
    int v20 = [a1 _attributedStringForLabel:v19 context:v8];
    [v18 requestLayoutForLabel:v19 attributedString:v20 width:(uint64_t)a4];
  }
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
        +[SKUIStackItemView sizeThatFitsWidth:viewElement:context:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  [a1 sizeThatFitsWidth:v8 viewElement:v9 context:0 numberOfLines:a3];
  double v19 = v18;
  double v21 = v20;

  double v22 = v19;
  double v23 = v21;
  result.height = v23;
  result.width = v22;
  return result;
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5 numberOfLines:(unint64_t *)a6
{
  id v10 = a4;
  id v11 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v12 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v12) {
        +[SKUIStackItemView sizeThatFitsWidth:viewElement:context:numberOfLines:](v12, v13, v14, v15, v16, v17, v18, v19);
      }
    }
  }
  uint64_t v36 = 0;
  v37 = (double *)&v36;
  uint64_t v38 = 0x3010000000;
  v39 = &unk_1C1D0F257;
  long long v40 = *MEMORY[0x1E4F1DB30];
  double v20 = [v10 imageElements];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __73__SKUIStackItemView_sizeThatFitsWidth_viewElement_context_numberOfLines___block_invoke;
  v35[3] = &unk_1E6429F38;
  v35[4] = &v36;
  [v20 enumerateObjectsUsingBlock:v35];

  v37[4] = v37[4] + -4.0;
  double v21 = [v10 textElement];
  if (v21)
  {
    double v22 = v37[4] + 7.0;
    v37[4] = v22;
    double v23 = [a1 _attributedStringForLabel:v21 context:v11];
    long long v24 = [a1 _textViewLayoutWithWidth:v23 string:a3 - v22];

    double v25 = v37[4];
    [v24 boundingSize];
    long long v27 = v37;
    v37[4] = v25 + v26;
    double v28 = v27[5];
    [v24 boundingSize];
    if (v28 >= v29) {
      double v30 = v28;
    }
    else {
      double v30 = v29;
    }
    v37[5] = v30;
    if (a6) {
      *a6 = [v24 numberOfLines];
    }
  }
  double v31 = v37[4];
  double v32 = v37[5];

  _Block_object_dispose(&v36, 8);
  double v33 = v31;
  double v34 = v32;
  result.height = v34;
  result.width = v33;
  return result;
}

void __73__SKUIStackItemView_sizeThatFitsWidth_viewElement_context_numberOfLines___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 size];
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = v4 + 4.0;
  double v5 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  [v3 size];
  double v7 = v6;

  if (v5 >= v7) {
    double v8 = v5;
  }
  else {
    double v8 = v7;
  }
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = v8;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(SKUIStackItemView *)self imageViewToImageResourceCacheKey];
  [v10 removeAllObjects];

  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __57__SKUIStackItemView_reloadWithViewElement_width_context___block_invoke;
  uint64_t v16 = &unk_1E64234F8;
  id v17 = v8;
  uint64_t v18 = self;
  double v20 = a4;
  id v19 = v9;
  id v11 = v9;
  id v12 = v8;
  [(SKUIViewReuseView *)self modifyUsingBlock:&v13];
  -[SKUIStackItemView setViewElement:](self, "setViewElement:", v12, v13, v14, v15, v16);
  [(SKUIStackItemView *)self setLastContext:v11];
}

void __57__SKUIStackItemView_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = [*(id *)(a1 + 32) textElement];
  double v5 = [*(id *)(a1 + 32) textElement];

  if (v5)
  {
    double v6 = [v3 addLabelViewWithElement:v4 width:*(void *)(a1 + 48) context:*(double *)(a1 + 56)];
    [*(id *)(a1 + 40) setTextView:v6];
  }
  double v7 = [MEMORY[0x1E4F1CA48] array];
  id v8 = [*(id *)(a1 + 32) imageElements];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __57__SKUIStackItemView_reloadWithViewElement_width_context___block_invoke_2;
  uint64_t v14 = &unk_1E6429F60;
  id v15 = v3;
  id v16 = *(id *)(a1 + 48);
  id v17 = v7;
  uint64_t v18 = *(void *)(a1 + 40);
  id v9 = v7;
  id v10 = v3;
  [v8 enumerateObjectsUsingBlock:&v11];

  objc_msgSend(*(id *)(a1 + 40), "setImageViews:", v9, v11, v12, v13, v14);
}

void __57__SKUIStackItemView_reloadWithViewElement_width_context___block_invoke_2(id *a1, void *a2)
{
  id v8 = a2;
  id v3 = objc_msgSend(a1[4], "addImageViewWithElement:context:");
  if (v3)
  {
    [a1[6] addObject:v3];
    double v4 = [a1[5] imageResourceCacheKeyForViewElement:v8];
    if (v4)
    {
      double v5 = [a1[7] imageViewToImageResourceCacheKey];

      if (!v5)
      {
        double v6 = (void *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:517 valueOptions:0 capacity:1];
        [a1[7] setImageViewToImageResourceCacheKey:v6];
      }
      double v7 = [a1[7] imageViewToImageResourceCacheKey];
      [v7 setObject:v4 forKey:v3];
    }
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
  uint64_t v11 = [(SKUIStackItemView *)self imageViewToImageResourceCacheKey];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    id v23 = v8;
    uint64_t v14 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v17 = [(SKUIStackItemView *)self imageViewToImageResourceCacheKey];
        uint64_t v18 = [v17 objectForKey:v16];

        id v19 = [v9 requestIdentifierForResourceCacheKey:v18];
        double v20 = v19;
        if (v19 && [v19 unsignedIntegerValue] == v10)
        {
          id v8 = v23;
          [v16 setImage:v23];

          BOOL v21 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v13) {
        continue;
      }
      break;
    }
    BOOL v21 = 0;
    id v8 = v23;
  }
  else
  {
    BOOL v21 = 0;
  }
LABEL_13:

  return v21;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  return 0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  [(SKUIStackItemView *)self contentInset];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v33 = 0;
  double v34 = (double *)&v33;
  uint64_t v35 = 0x3010000000;
  uint64_t v36 = &unk_1C1D0F257;
  double v37 = v5;
  uint64_t v38 = v11;
  uint64_t v12 = [(SKUIStackItemView *)self imageViews];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __34__SKUIStackItemView_sizeThatFits___block_invoke;
  v32[3] = &unk_1E6429F88;
  v32[4] = &v33;
  *(double *)&v32[5] = width - v6 - v10;
  [v12 enumerateObjectsUsingBlock:v32];

  v40.size.double width = *(CGFloat *)(MEMORY[0x1E4F1DB28] + 16);
  v40.size.height = *(CGFloat *)(MEMORY[0x1E4F1DB28] + 24);
  CGFloat v13 = v34[5];
  CGFloat v14 = v34[4] + -4.0 + 7.0;
  v40.origin.x = v14;
  v40.origin.y = v13;
  double MinX = CGRectGetMinX(v40);
  id v16 = objc_opt_class();
  id v17 = [(SKUIStackItemView *)self textView];
  uint64_t v18 = [v17 layout];
  id v19 = [v18 attributedString];
  double v20 = width - MinX - v10;
  BOOL v21 = [v16 _textViewLayoutWithWidth:v19 string:v20];
  double v22 = [(SKUIStackItemView *)self textView];
  [v22 setLayout:v21];

  id v23 = [(SKUIStackItemView *)self textView];
  objc_msgSend(v23, "sizeThatFits:", v20, 1.79769313e308);
  CGFloat v25 = v24;
  CGFloat v27 = v26;

  v41.origin.x = v14;
  v41.origin.y = v13;
  v41.size.double width = v25;
  v41.size.height = v27;
  double MaxX = CGRectGetMaxX(v41);
  v42.origin.x = v14;
  v42.origin.y = v13;
  v42.size.double width = v25;
  v42.size.height = v27;
  double v29 = v8 + CGRectGetMaxY(v42);
  _Block_object_dispose(&v33, 8);
  double v30 = v10 + MaxX;
  double v31 = v29;
  result.height = v31;
  result.double width = v30;
  return result;
}

CGFloat __34__SKUIStackItemView_sizeThatFits___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  double v4 = *(double *)(v3 + 32);
  CGFloat v5 = *(double *)(v3 + 40);
  objc_msgSend(a2, "sizeThatFits:", *(double *)(a1 + 40) - v4, 1.79769313e308);
  v9.size.double width = v6;
  v9.size.height = v7;
  v9.origin.x = v4;
  v9.origin.y = v5;
  CGFloat result = CGRectGetMaxX(v9) + 4.0;
  *(CGFloat *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = result;
  return result;
}

- (void)layoutSubviews
{
  v54.receiver = self;
  v54.super_class = (Class)SKUIStackItemView;
  [(SKUIStackItemView *)&v54 layoutSubviews];
  [(SKUIStackItemView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(SKUIStackItemView *)self contentInset];
  double v12 = v11;
  double v14 = v13;
  double v44 = v15;
  double v17 = v16;
  v55.origin.x = v4;
  v55.origin.y = v6;
  v55.size.double width = v8;
  v55.size.height = v10;
  double Width = CGRectGetWidth(v55);
  uint64_t v48 = 0;
  v49 = (double *)&v48;
  uint64_t v50 = 0x3010000000;
  v51 = &unk_1C1D0F257;
  double v52 = v14;
  double v53 = v12;
  double v45 = v12;
  id v19 = [(SKUIStackItemView *)self imageViews];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __35__SKUIStackItemView_layoutSubviews__block_invoke;
  v47[3] = &unk_1E6429F88;
  double v20 = Width - v14 - v17;
  v47[4] = &v48;
  *(double *)&v47[5] = v20;
  [v19 enumerateObjectsUsingBlock:v47];

  double v21 = v49[4];
  double v22 = v49[5];
  v56.origin.x = v4;
  v56.origin.y = v6;
  v56.size.double width = v8;
  v56.size.height = v10;
  double Height = CGRectGetHeight(v56);
  double v24 = objc_opt_class();
  double v25 = v21 + -4.0 + 7.0;
  double v26 = v20 - v21;
  double v27 = Height - v45 - v44;
  v57.origin.x = v25;
  v57.origin.y = v22;
  v57.size.double width = v20 - v21;
  v57.size.height = v27;
  double v28 = CGRectGetWidth(v57);
  double v29 = [(SKUIStackItemView *)self textView];
  double v30 = [v29 layout];
  double v31 = [v30 attributedString];
  double v32 = [v24 _textViewLayoutWithWidth:v31 string:v28];
  uint64_t v33 = [(SKUIStackItemView *)self textView];
  [v33 setLayout:v32];

  if ([(SKUIStackItemView *)self numberOfLines] < 2)
  {
    uint64_t v36 = [(SKUIStackItemView *)self textView];
    double v37 = [v36 layout];
    [v37 boundingSize];
    double v39 = v38;

    uint64_t v35 = [(SKUIStackItemView *)self textView];
    CGRect v40 = [v35 layout];
    [v40 boundingSize];
    double v42 = v41;
    double v22 = (v27 - v39) * 0.5;

    double v27 = v42;
  }
  else
  {
    v58.origin.x = v21 + -4.0 + 7.0;
    v58.origin.y = v22;
    v58.size.double width = v20 - v21;
    v58.size.height = v27;
    CGFloat MidY = CGRectGetMidY(v58);
    uint64_t v35 = [(SKUIStackItemView *)self imageViews];
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __35__SKUIStackItemView_layoutSubviews__block_invoke_2;
    v46[3] = &__block_descriptor_40_e23_v32__0__UIView_8Q16_B24l;
    *(CGFloat *)&v46[4] = MidY;
    [v35 enumerateObjectsUsingBlock:v46];
  }

  v43 = [(SKUIStackItemView *)self textView];
  v59.origin.x = v25;
  v59.origin.y = v22;
  v59.size.double width = v26;
  v59.size.height = v27;
  CGRect v60 = CGRectIntegral(v59);
  objc_msgSend(v43, "setFrame:", v60.origin.x, v60.origin.y, v60.size.width, v60.size.height);

  _Block_object_dispose(&v48, 8);
}

CGFloat __35__SKUIStackItemView_layoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  double v4 = *(double *)(v3 + 32);
  double v5 = *(double *)(v3 + 40);
  double v6 = *(double *)(a1 + 40) - v4;
  id v7 = a2;
  objc_msgSend(v7, "sizeThatFits:", v6, 1.79769313e308);
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  objc_msgSend(v7, "setFrame:", v4, v5, v8, v10);

  v13.origin.x = v4;
  v13.origin.y = v5;
  v13.size.double width = v9;
  v13.size.height = v11;
  CGFloat result = CGRectGetMaxX(v13) + 4.0;
  *(CGFloat *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = result;
  return result;
}

void __35__SKUIStackItemView_layoutSubviews__block_invoke_2(uint64_t a1, void *a2)
{
  id v13 = a2;
  [v13 frame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  double v11 = *(double *)(a1 + 32);
  [v13 frame];
  CGFloat v12 = v11 - CGRectGetMidY(v15);
  v16.origin.x = v4;
  v16.origin.y = v6;
  v16.size.double width = v8;
  v16.size.height = v10;
  CGRect v17 = CGRectOffset(v16, 0.0, v12);
  objc_msgSend(v13, "setFrame:", v17.origin.x, v17.origin.y, v17.size.width, v17.size.height);
}

+ (id)_attributedStringForLabel:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = [v5 style];
  CGFloat v8 = SKUIViewElementFontWithStyle(v7);
  if (!v8)
  {
    CGFloat v8 = SKUIFontPreferredFontForTextStyle(5);
  }
  double v9 = [v6 tintColor];
  CGFloat v10 = SKUIViewElementPlainColorWithStyle(v7, v9);

  if (!v10)
  {
    BOOL v11 = [v5 labelViewStyle] == 5;
    CGFloat v10 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:dbl_1C1CCC050[v11]];
  }
  CGFloat v12 = [v5 text];
  id v13 = [v12 attributedStringWithDefaultFont:v8 foregroundColor:v10 style:v7];

  return v13;
}

+ (id)_textViewLayoutWithWidth:(double)a3 string:(id)a4
{
  id v5 = (void *)[a4 mutableCopy];
  id v6 = objc_alloc_init(MEMORY[0x1E4FB0848]);
  [v6 setLineSpacing:-2.0];
  objc_msgSend(v5, "addAttribute:value:range:", *MEMORY[0x1E4FB0738], v6, 0, objc_msgSend(v5, "length"));
  double v7 = [[SKUIAttributedStringLayoutRequest alloc] initWithAttributedString:v5];
  [(SKUIAttributedStringLayoutRequest *)v7 setWidth:a3];
  CGFloat v8 = [[SKUIAttributedStringLayout alloc] initWithLayoutRequest:v7];

  return v8;
}

- (UIEdgeInsets)contentInset
{
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double bottom = self->_contentInset.bottom;
  double right = self->_contentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
}

- (SKUIStackItemViewElement)viewElement
{
  return self->_viewElement;
}

- (void)setViewElement:(id)a3
{
}

- (SKUIViewElementLayoutContext)lastContext
{
  return self->_lastContext;
}

- (void)setLastContext:(id)a3
{
}

- (SKUIAttributedStringView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
}

- (NSArray)imageViews
{
  return self->_imageViews;
}

- (void)setImageViews:(id)a3
{
}

- (NSMapTable)imageViewToImageResourceCacheKey
{
  return self->_imageViewToImageResourceCacheKey;
}

- (void)setImageViewToImageResourceCacheKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageViewToImageResourceCacheKey, 0);
  objc_storeStrong((id *)&self->_imageViews, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_lastContext, 0);

  objc_storeStrong((id *)&self->_viewElement, 0);
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

+ (void)sizeThatFitsWidth:(uint64_t)a3 viewElement:(uint64_t)a4 context:(uint64_t)a5 numberOfLines:(uint64_t)a6 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end