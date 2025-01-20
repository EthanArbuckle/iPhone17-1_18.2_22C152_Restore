@interface SUUIAdornedImageViewReuseView
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (id)_attributedStringForButton:(id)a3 context:(id)a4;
+ (id)_attributedStringForButtonText:(id)a3 type:(int64_t)a4 style:(id)a5 context:(id)a6;
+ (id)_attributedStringForLabel:(id)a3 context:(id)a4;
+ (id)_attributedStringForMenuItem:(id)a3 context:(id)a4;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (CGRect)frameForView:(id)a3;
- (SUUIAdornedImageViewReuseView)init;
- (SUUIPlayButton)playButton;
- (id)viewForElementIdentifier:(id)a3;
- (void)_buttonAction:(id)a3;
- (void)layoutSubviews;
- (void)mediaPlayer:(id)a3 itemStateChanged:(id)a4;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
@end

@implementation SUUIAdornedImageViewReuseView

- (SUUIAdornedImageViewReuseView)init
{
  v6.receiver = self;
  v6.super_class = (Class)SUUIAdornedImageViewReuseView;
  v2 = [(SUUIAdornedImageViewReuseView *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:0 valueOptions:0 capacity:0];
    viewElementViews = v2->_viewElementViews;
    v2->_viewElementViews = (NSMapTable *)v3;
  }
  return v2;
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
  v11[2] = __80__SUUIAdornedImageViewReuseView_prefetchResourcesForViewElement_reason_context___block_invoke;
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

uint64_t __80__SUUIAdornedImageViewReuseView_prefetchResourcesForViewElement_reason_context___block_invoke(uint64_t a1, uint64_t a2)
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
  id v8 = a5;
  id v9 = a3;
  [v9 size];
  if (v10 <= a4) {
    a4 = v10;
  }
  double v11 = [v8 labelLayoutCache];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __75__SUUIAdornedImageViewReuseView_requestLayoutForViewElement_width_context___block_invoke;
  v14[3] = &unk_265400C10;
  double v17 = a4;
  id v18 = a1;
  id v15 = v11;
  id v16 = v8;
  id v12 = v8;
  id v13 = v11;
  [v9 enumerateChildrenUsingBlock:v14];
}

void __75__SUUIAdornedImageViewReuseView_requestLayoutForViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v13 = 0;
  uint64_t v4 = [v3 style];
  SUUIViewElementMarginForStyle(v4, &v13);
  double v6 = v5;
  double v8 = v7;

  double v9 = v6 + v8;
  if (!v13) {
    double v9 = 16.0;
  }
  double v10 = *(double *)(a1 + 48) - v9;
  uint64_t v11 = [v3 elementType];
  if (v11 > 137)
  {
    if (v11 == 138)
    {
      id v12 = [*(id *)(a1 + 56) _attributedStringForLabel:v3 context:*(void *)(a1 + 40)];
      [*(id *)(a1 + 32) requestLayoutForLabel:v3 attributedString:v12 width:(uint64_t)v10];
      goto LABEL_12;
    }
    if (v11 == 141)
    {
LABEL_9:
      id v12 = [*(id *)(a1 + 56) _attributedStringForButton:v3 context:*(void *)(a1 + 40)];
      [*(id *)(a1 + 32) requestLayoutForButton:v3 attributedString:v12 width:(uint64_t)v10];
LABEL_12:
    }
  }
  else
  {
    if (v11 != 8)
    {
      if (v11 != 12) {
        goto LABEL_13;
      }
      goto LABEL_9;
    }
    [*(id *)(a1 + 32) requestLayoutForBadge:v3 width:(uint64_t)v10];
  }
LABEL_13:
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  [a5 sizeForViewElement:a4 width:a3];
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  [(NSMapTable *)self->_viewElementViews removeAllObjects];
  [(NSMapTable *)self->_imageViewToImageResourceCacheKey removeAllObjects];
  objc_storeStrong((id *)&self->_imageViewElement, a3);
  playButton = self->_playButton;
  self->_playButton = 0;

  self->_playButtonPosition = 0;
  uint64_t v29 = MEMORY[0x263EF8330];
  uint64_t v30 = 3221225472;
  v31 = __69__SUUIAdornedImageViewReuseView_reloadWithViewElement_width_context___block_invoke;
  v32 = &unk_265400C88;
  id v12 = v9;
  id v33 = v12;
  double v36 = a4;
  id v13 = v10;
  id v34 = v13;
  v35 = self;
  [(SUUIViewReuseView *)self modifyUsingBlock:&v29];
  int64_t v14 = +[SUUIMediaPlayerInterface sharedInstance];
  [v14 removeObserver:self];

  id v15 = self->_playButton;
  if (v15)
  {
    id v16 = [(SUUIPlayButton *)v15 playItemIdentifier];

    if (v16)
    {
      double v17 = +[SUUIMediaPlayerInterface sharedInstance];
      id v18 = [(SUUIPlayButton *)self->_playButton playItemIdentifier];
      v19 = [v17 playerForItemWithIdentifier:v18];

      v20 = [(SUUIPlayButton *)self->_playButton playItemIdentifier];
      if ([v17 identifierIsOnDeck:v20])
      {
        BOOL v21 = [(SUUIPlayButtonControl *)self->_playButton isIndeterminate];

        if (!v21)
        {
          [(SUUIPlayButtonControl *)self->_playButton beginIndeterminateAnimation];
          v22 = self->_playButton;
          BOOL v23 = 0;
          goto LABEL_16;
        }
      }
      else
      {
      }
      if (!v19)
      {
        [(SUUIPlayButtonControl *)self->_playButton hideProgressAnimated:1];
        if ([(SUUIPlayButton *)self->_playButton showOnDemand]) {
          [(SUUIPlayButton *)self->_playButton setHidden:1];
        }
        goto LABEL_17;
      }
      v24 = [v19 playerItem];
      unint64_t v25 = [v24 playState];

      if ([(SUUIPlayButton *)self->_playButton showOnDemand]) {
        [(SUUIPlayButton *)self->_playButton setHidden:0];
      }
      if (v25 <= 5 && ((1 << v25) & 0x31) != 0)
      {
        [(SUUIPlayButtonControl *)self->_playButton hideProgressAnimated:1];
LABEL_17:
        v28 = +[SUUIMediaPlayerInterface sharedInstance];
        [v28 addObserver:self];

        goto LABEL_18;
      }
      v26 = self->_playButton;
      v27 = [v19 playerItem];
      [(SUUIPlayButton *)v26 reloadWithItemStatus:v27 animated:0];

      v22 = self->_playButton;
      BOOL v23 = v25 == 3;
LABEL_16:
      [(SUUIPlayButtonControl *)v22 showPlayIndicator:v23];
      goto LABEL_17;
    }
  }
LABEL_18:
}

void __69__SUUIAdornedImageViewReuseView_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __69__SUUIAdornedImageViewReuseView_reloadWithViewElement_width_context___block_invoke_2;
  v10[3] = &unk_265401B90;
  uint64_t v15 = *(void *)(a1 + 56);
  id v11 = v4;
  id v12 = v3;
  double v5 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  id v13 = v6;
  uint64_t v14 = v7;
  id v8 = v3;
  id v9 = v4;
  [v5 enumerateChildrenUsingBlock:v10];
}

void __69__SUUIAdornedImageViewReuseView_reloadWithViewElement_width_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 style];
  uint64_t v5 = [v4 elementPosition];
  if (v5) {
    unint64_t v6 = v5;
  }
  else {
    unint64_t v6 = 9;
  }
  while ([*(id *)(a1 + 32) count] <= v6)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    id v8 = [NSNumber numberWithBool:0];
    [v7 addObject:v8];
  }
  id v9 = [*(id *)(a1 + 32) objectAtIndex:v6];
  char v10 = [v9 BOOLValue];

  if ((v10 & 1) == 0)
  {
    id v11 = *(void **)(a1 + 32);
    id v12 = [NSNumber numberWithBool:1];
    [v11 replaceObjectAtIndex:v6 withObject:v12];

    char v31 = 0;
    SUUIViewElementMarginForStyle(v4, &v31);
    double v15 = v13 + v14;
    if (!v31) {
      double v15 = 16.0;
    }
    double v16 = *(double *)(a1 + 64) - v15;
    uint64_t v17 = [v3 elementType];
    id v18 = 0;
    if (v17 <= 48)
    {
      if (v17 == 8)
      {
        id v22 = [*(id *)(a1 + 40) addBadgeViewWithElement:v3 width:*(void *)(a1 + 48) context:v16];
LABEL_28:
        id v18 = v22;
        id v19 = v22;
        if (!v22) {
          goto LABEL_34;
        }
        goto LABEL_29;
      }
      if (v17 == 12) {
        goto LABEL_20;
      }
      id v19 = 0;
      if (v17 != 29) {
        goto LABEL_36;
      }
    }
    else
    {
      if (v17 > 137)
      {
        if (v17 == 138)
        {
          id v18 = [*(id *)(a1 + 40) addLabelViewWithElement:v3 width:*(void *)(a1 + 48) context:v16];
          id v19 = 0;
          if (!v18) {
            goto LABEL_36;
          }
          goto LABEL_35;
        }
        id v19 = 0;
        if (v17 != 141)
        {
LABEL_36:

          goto LABEL_37;
        }
LABEL_20:
        BOOL v23 = [*(id *)(a1 + 40) addButtonWithElement:v3 width:*(void *)(a1 + 48) context:v16];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_storeStrong((id *)(*(void *)(a1 + 56) + 440), v23);
          v24 = [v3 style];
          *(void *)(*(void *)(a1 + 56) + 448) = [v24 elementPosition];
        }
        [v23 addTarget:*(void *)(a1 + 56) action:sel__buttonAction_ forControlEvents:64];
        LODWORD(v25) = -0.5;
        [v23 setCharge:v25];
        id v18 = v23;
        if ([v3 elementType] == 50) {
          id v19 = v18;
        }
        else {
          id v19 = 0;
        }

        if (!v19)
        {
LABEL_34:
          if (v18)
          {
LABEL_35:
            [*(id *)(*(void *)(a1 + 56) + 456) setObject:v18 forKey:v3];
            [*(id *)(*(void *)(a1 + 56) + 456) setObject:v3 forKey:v18];
            goto LABEL_36;
          }
          goto LABEL_36;
        }
LABEL_29:
        v26 = [*(id *)(a1 + 48) imageResourceCacheKeyForViewElement:v3];
        if (v26)
        {
          v27 = *(void **)(*(void *)(a1 + 56) + 424);
          if (!v27)
          {
            uint64_t v28 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:517 valueOptions:0 capacity:1];
            uint64_t v29 = *(void *)(a1 + 56);
            uint64_t v30 = *(void **)(v29 + 424);
            *(void *)(v29 + 424) = v28;

            v27 = *(void **)(*(void *)(a1 + 56) + 424);
          }
          [v27 setObject:v26 forKey:v19];
        }

        goto LABEL_34;
      }
      if (v17 != 49)
      {
        id v19 = 0;
        if (v17 != 50) {
          goto LABEL_36;
        }
        goto LABEL_20;
      }
    }
    v20 = [*(id *)(a1 + 40) addImageViewWithElement:v3 context:*(void *)(a1 + 48)];
    BOOL v21 = [v20 tapRecognizer];
    [v21 addTarget:*(void *)(a1 + 56) action:sel__buttonAction_];

    id v22 = v20;
    goto LABEL_28;
  }
LABEL_37:
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
        double v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        double v16 = -[NSMapTable objectForKey:](self->_imageViewToImageResourceCacheKey, "objectForKey:", v15, v22);
        uint64_t v17 = [v9 requestIdentifierForResourceCacheKey:v16];
        id v18 = v17;
        if (v17 && [v17 unsignedIntegerValue] == v10)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v20 = [v15 imageView];
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
  id v4 = a3;
  uint64_t v5 = [(SUUIViewElement *)self->_imageViewElement flattenedChildren];
  unint64_t v6 = [(SUUIViewReuseView *)self allExistingViews];
  uint64_t v15 = 0;
  double v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__12;
  BOOL v19 = __Block_byref_object_dispose__12;
  id v20 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __58__SUUIAdornedImageViewReuseView_viewForElementIdentifier___block_invoke;
  v11[3] = &unk_265401BB8;
  id v7 = v4;
  id v12 = v7;
  id v8 = v6;
  id v13 = v8;
  double v14 = &v15;
  [v5 enumerateObjectsUsingBlock:v11];
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __58__SUUIAdornedImageViewReuseView_viewForElementIdentifier___block_invoke(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  id v11 = [a2 itmlID];
  if ([v11 isEqualToString:*(void *)(a1 + 32)])
  {
    unint64_t v7 = [*(id *)(a1 + 40) count];

    if (v7 > a3)
    {
      uint64_t v8 = [*(id *)(a1 + 40) objectAtIndex:a3];
      uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      *a4 = 1;
    }
  }
  else
  {
  }
}

- (CGRect)frameForView:(id)a3
{
  viewElementViews = self->_viewElementViews;
  id v5 = a3;
  unint64_t v6 = [(NSMapTable *)viewElementViews objectForKey:v5];
  unint64_t v7 = [v6 style];
  char v38 = 0;
  double v8 = SUUIViewElementMarginForStyle(v7, &v38);
  if (v38) {
    double v12 = v11;
  }
  else {
    double v12 = 8.0;
  }
  if (v38) {
    double v13 = v10;
  }
  else {
    double v13 = 8.0;
  }
  if (v38) {
    double v14 = v9;
  }
  else {
    double v14 = 8.0;
  }
  if (v38) {
    double v15 = v8;
  }
  else {
    double v15 = 8.0;
  }
  [(SUUIAdornedImageViewReuseView *)self frame];
  CGFloat v16 = CGRectGetWidth(v39) - (v12 + v14);
  [(SUUIAdornedImageViewReuseView *)self frame];
  CGFloat Height = CGRectGetHeight(v40);
  CGFloat v19 = *MEMORY[0x263F001A8];
  CGFloat v18 = *(double *)(MEMORY[0x263F001A8] + 8);
  objc_msgSend(v5, "sizeThatFits:", v16, Height - (v13 + v15));
  CGFloat v21 = v20;
  CGFloat v23 = v22;

  unint64_t v24 = [v7 elementPosition];
  if (v24 > 9)
  {
    double v14 = v19;
  }
  else if (((1 << v24) & 0x2A1) != 0)
  {
    [(SUUIAdornedImageViewReuseView *)self bounds];
    double Width = CGRectGetWidth(v43);
    v44.origin.CGFloat x = v19;
    v44.origin.CGFloat y = v18;
    v44.size.width = v21;
    v44.size.height = v23;
    double v14 = Width - CGRectGetWidth(v44) - v12;
  }
  else if (((1 << v24) & 0xE) != 0)
  {
    [(SUUIAdornedImageViewReuseView *)self bounds];
    double MidX = CGRectGetMidX(v41);
    v42.origin.CGFloat x = v19;
    v42.origin.CGFloat y = v18;
    v42.size.width = v21;
    v42.size.height = v23;
    double v14 = MidX + CGRectGetWidth(v42) * -0.5;
  }
  unint64_t v27 = [v7 elementPosition];
  if (v27 > 9)
  {
    double v15 = v18;
  }
  else if (((1 << v27) & 0x309) != 0)
  {
    [(SUUIAdornedImageViewReuseView *)self bounds];
    double v29 = CGRectGetHeight(v47);
    v48.origin.CGFloat x = v14;
    v48.origin.CGFloat y = v18;
    v48.size.width = v21;
    v48.size.height = v23;
    double v15 = v29 - CGRectGetHeight(v48) - v13;
  }
  else if (((1 << v27) & 0x32) != 0)
  {
    [(SUUIAdornedImageViewReuseView *)self bounds];
    double MidY = CGRectGetMidY(v45);
    v46.origin.CGFloat x = v14;
    v46.origin.CGFloat y = v18;
    v46.size.width = v21;
    v46.size.height = v23;
    double v15 = MidY + CGRectGetHeight(v46) * -0.5;
  }
  v49.origin.CGFloat x = v14;
  v49.origin.CGFloat y = v15;
  v49.size.width = v21;
  v49.size.height = v23;
  CGRect v50 = CGRectIntegral(v49);
  CGFloat x = v50.origin.x;
  CGFloat y = v50.origin.y;
  CGFloat v32 = v50.size.width;
  CGFloat v33 = v50.size.height;

  double v34 = x;
  double v35 = y;
  double v36 = v32;
  double v37 = v33;
  result.size.height = v37;
  result.size.width = v36;
  result.origin.CGFloat y = v35;
  result.origin.CGFloat x = v34;
  return result;
}

- (void)layoutSubviews
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v13.receiver = self;
  v13.super_class = (Class)SUUIAdornedImageViewReuseView;
  [(SUUIAdornedImageViewReuseView *)&v13 layoutSubviews];
  id v3 = [(SUUIViewReuseView *)self allExistingViews];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        [(SUUIAdornedImageViewReuseView *)self frameForView:v8];
        objc_msgSend(v8, "setFrame:");
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)_buttonAction:(id)a3
{
  if (self->_playButton == a3)
  {
    id v9 = +[SUUIMediaPlayerInterface sharedInstance];
    uint64_t v5 = [(SUUIPlayButton *)self->_playButton playItemIdentifier];
    int v6 = [v9 isItemWithIdentifierActive:v5];

    if (v6)
    {
      unint64_t v7 = [(SUUIPlayButton *)self->_playButton playItemIdentifier];
      [v9 togglePlayStateForItemWithIdentifier:v7];
    }
    else
    {
      unint64_t v7 = [(NSMapTable *)self->_viewElementViews objectForKey:self->_playButton];
      if (v7)
      {
        if ([(SUUIPlayButtonControl *)self->_playButton isDisabledButSelectable])
        {
          [v7 dispatchEvent:0x270509DB0 eventAttribute:0x270509DD0 canBubble:1 isCancelable:0 extraInfo:0 completionBlock:0];
        }
        else
        {
          double v8 = [(SUUIPlayButton *)self->_playButton playItemIdentifier];
          [v9 notifyWillChangeToItemWithItemIdentifer:v8];

          if (![(SUUIPlayButtonControl *)self->_playButton isIndeterminate]) {
            [(SUUIPlayButtonControl *)self->_playButton beginIndeterminateAnimation];
          }
          [v7 dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];
        }
      }
    }
  }
  else
  {
    uint64_t v4 = -[NSMapTable objectForKey:](self->_viewElementViews, "objectForKey:");
    if (!v4) {
      goto LABEL_15;
    }
    id v9 = v4;
    if (objc_opt_respondsToSelector()) {
      [v9 dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];
    }
  }
  uint64_t v4 = v9;
LABEL_15:
}

- (void)mediaPlayer:(id)a3 itemStateChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  playButton = self->_playButton;
  if (playButton)
  {
    id v9 = [(SUUIPlayButton *)playButton playItemIdentifier];
    BOOL v10 = +[SUUIMediaPlayerInterface identifierMatches:v9 item:v7];

    if (v10)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __62__SUUIAdornedImageViewReuseView_mediaPlayer_itemStateChanged___block_invoke;
      block[3] = &unk_265400890;
      block[4] = self;
      id v17 = v7;
      dispatch_async(MEMORY[0x263EF83A0], block);
      long long v11 = v17;
LABEL_7:

      goto LABEL_8;
    }
    if ([(SUUIPlayButtonControl *)self->_playButton isIndeterminate]
      || [(SUUIPlayButtonControl *)self->_playButton showingProgress])
    {
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __62__SUUIAdornedImageViewReuseView_mediaPlayer_itemStateChanged___block_invoke_2;
      v13[3] = &unk_265400890;
      id v14 = v7;
      uint64_t v15 = self;
      dispatch_async(MEMORY[0x263EF83A0], v13);
      long long v11 = v14;
      goto LABEL_7;
    }
    if ([(SUUIPlayButton *)self->_playButton showOnDemand])
    {
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __62__SUUIAdornedImageViewReuseView_mediaPlayer_itemStateChanged___block_invoke_3;
      v12[3] = &unk_265400980;
      v12[4] = self;
      dispatch_async(MEMORY[0x263EF83A0], v12);
    }
  }
LABEL_8:
}

uint64_t __62__SUUIAdornedImageViewReuseView_mediaPlayer_itemStateChanged___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 440) showOnDemand]) {
    [*(id *)(*(void *)(a1 + 32) + 440) setHidden:0];
  }
  uint64_t v2 = [*(id *)(a1 + 40) playState];
  id v3 = *(void **)(*(void *)(a1 + 32) + 440);
  if ((unint64_t)(v2 - 6) > 0xFFFFFFFFFFFFFFFDLL)
  {
    return [v3 hideProgressAnimated:1];
  }
  else
  {
    [v3 reloadWithItemStatus:*(void *)(a1 + 40) animated:0];
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 440);
    return [v4 showPlayIndicator:v2 == 3];
  }
}

uint64_t __62__SUUIAdornedImageViewReuseView_mediaPlayer_itemStateChanged___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) playState];
  if (result != 5)
  {
    [*(id *)(*(void *)(a1 + 40) + 440) hideProgressAnimated:0];
    uint64_t result = [*(id *)(*(void *)(a1 + 40) + 440) showOnDemand];
    if (result)
    {
      id v3 = *(void **)(*(void *)(a1 + 40) + 440);
      return [v3 setHidden:1];
    }
  }
  return result;
}

uint64_t __62__SUUIAdornedImageViewReuseView_mediaPlayer_itemStateChanged___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 440) setHidden:1];
}

+ (id)_attributedStringForButton:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [v6 buttonText];
  uint64_t v9 = [v6 buttonViewType];
  BOOL v10 = [v6 buttonTitleStyle];
  if (v10)
  {
    long long v11 = [a1 _attributedStringForButtonText:v8 type:v9 style:v10 context:v7];
  }
  else
  {
    long long v12 = [v6 style];
    long long v11 = [a1 _attributedStringForButtonText:v8 type:v9 style:v12 context:v7];
  }
  return v11;
}

+ (id)_attributedStringForButtonText:(id)a3 type:(int64_t)a4 style:(id)a5 context:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  long long v12 = SUUIViewElementFontWithStyle(v10);
  if (!v12)
  {
    if (a4) {
      uint64_t v13 = 5;
    }
    else {
      uint64_t v13 = 1;
    }
    long long v12 = SUUIFontPreferredFontForTextStyle(v13);
  }
  id v14 = [v11 tintColor];
  uint64_t v15 = SUUIViewElementPlainColorWithStyle(v10, v14);

  if (!v15)
  {
    uint64_t v15 = [MEMORY[0x263F825C8] blackColor];
  }
  CGFloat v16 = [v9 attributedStringWithDefaultFont:v12 foregroundColor:v15 style:v10];

  return v16;
}

+ (id)_attributedStringForLabel:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 style];
  double v8 = SUUIViewElementFontWithStyle(v7);
  if (!v8)
  {
    double v8 = SUUIFontPreferredFontForTextStyle(5);
  }
  id v9 = [v6 tintColor];
  id v10 = SUUIViewElementPlainColorWithStyle(v7, v9);

  if (!v10)
  {
    id v10 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.8];
  }
  uint64_t v11 = SUUIViewElementAlignmentForStyle(v7);
  if (v11) {
    uint64_t v12 = SUUIViewElementNSTextAlignmentForIKElementAlignment(v11);
  }
  else {
    uint64_t v12 = 0;
  }
  uint64_t v13 = [v5 text];
  id v14 = [v13 attributedStringWithDefaultFont:v8 foregroundColor:v10 textAlignment:v12 style:v7];

  return v14;
}

+ (id)_attributedStringForMenuItem:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [v7 itemText];
  id v9 = [v7 style];

  id v10 = [a1 _attributedStringForButtonText:v8 type:0 style:v9 context:v6];

  return v10;
}

- (SUUIPlayButton)playButton
{
  return self->_playButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElementViews, 0);
  objc_storeStrong((id *)&self->_playButton, 0);
  objc_storeStrong((id *)&self->_imageViewElement, 0);
  objc_storeStrong((id *)&self->_imageViewToImageResourceCacheKey, 0);
}

@end